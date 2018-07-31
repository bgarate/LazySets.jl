import Base.∈

export AbstractHPolygon,
       an_element,
       addconstraint!,
       vertices_list,
       constraints_list

# This constant marks the threshold for the number of constraints of a polygon
# above which we use a binary search to find the relevant constraint in a
# support vector query.
#
# NOTE: The value must be strictly greater than 2.
const BINARY_SEARCH_THRESHOLD = 10

"""
    AbstractHPolygon{N<:Real} <: AbstractPolygon{N}

Abstract type for polygons in H-representation (i.e., constraints).

### Notes

Every concrete `AbstractHPolygon` must have the following fields:
- `constraints::Vector{LinearConstraint{N}}` -- the constraints

New subtypes should be added to the `convert` method in order to be convertible.

```jldoctest
julia> subtypes(AbstractHPolygon)
2-element Array{Union{DataType, UnionAll},1}:
 LazySets.HPolygon
 LazySets.HPolygonOpt
```
"""
abstract type AbstractHPolygon{N<:Real} <: AbstractPolygon{N} end


# --- AbstractPolygon interface functions ---


"""
    tovrep(P::AbstractHPolygon{N})::VPolygon{N} where {N<:Real}

Build a vertex representation of the given polygon.

### Input

- `P` -- polygon in constraint representation

### Output

The same polygon but in vertex representation, a `VPolygon`.
"""
function tovrep(P::AbstractHPolygon{N})::VPolygon{N} where {N<:Real}
    return VPolygon(vertices_list(P))
end


"""
    tohrep(P::AbstractHPolygon{N})::AbstractHPolygon{N} where {N<:Real}

Build a contraint representation of the given polygon.

### Input

- `P` -- polygon in constraint representation

### Output

The identity, i.e., the same polygon instance.
"""
function tohrep(P::AbstractHPolygon{N})::AbstractHPolygon{N} where {N<:Real}
    return P
end


# --- AbstractPolytope interface functions ---


"""
    vertices_list(P::AbstractHPolygon{N},
                  apply_convex_hull::Bool=false
                 )::Vector{Vector{N}} where {N<:Real}

Return the list of vertices of a polygon in constraint representation.

### Input

- `P`                 -- polygon in constraint representation
- `apply_convex_hull` -- (optional, default: `false`) to post process or not the
                         intersection of constraints with a convex hull

### Output

List of vertices.
"""
function vertices_list(P::AbstractHPolygon{N},
                       apply_convex_hull::Bool=false
                      )::Vector{Vector{N}} where {N<:Real}
    n = length(P.constraints)
    points = Vector{Vector{N}}(n)
    if n == 0
        return points
    end
    @inbounds for i in 1:n-1
        points[i] = element(intersection(Line(P.constraints[i]),
                                         Line(P.constraints[i+1])))
    end
    points[n] = element(intersection(Line(P.constraints[n]),
                                     Line(P.constraints[1])))
    return apply_convex_hull ? convex_hull(points) : points
end

"""
    constraints_list(P::AbstractHPolygon{N})::Vector{LinearConstraint{N}} where {N<:Real}

Return the list of constraints defining a polygon in H-representation.

### Input

- `P` -- polygon in H-representation

### Output

The list of constraints of the polygon.
"""
function constraints_list(P::AbstractHPolygon{N})::Vector{LinearConstraint{N}} where {N<:Real}
    return P.constraints
end

# --- LazySet interface functions ---


"""
    an_element(P::AbstractHPolygon{N})::Vector{N} where {N<:Real}

Return some element of a polygon in constraint representation.

### Input

- `P` -- polygon in constraint representation

### Output

A vertex of the polygon in constraint representation (the first one in the order
of the constraints).
"""
function an_element(P::AbstractHPolygon{N})::Vector{N} where {N<:Real}
    @assert length(P.constraints) >= 2 "polygon has less than two constraints"
    return element(intersection(Line(P.constraints[1]),
                                Line(P.constraints[2])))
end

"""
    ∈(x::AbstractVector{N}, P::AbstractHPolygon{N})::Bool where {N<:Real}

Check whether a given 2D point is contained in a polygon in constraint
representation.

### Input

- `x` -- two-dimensional point/vector
- `P` -- polygon in constraint representation

### Output

`true` iff ``x ∈ P``.

### Algorithm

This implementation checks if the point lies on the outside of each edge.
"""
function ∈(x::AbstractVector{N}, P::AbstractHPolygon{N})::Bool where {N<:Real}
    @assert length(x) == 2

    for c in P.constraints
        if dot(c.a, x) > c.b
            return false
        end
    end
    return true
end


# --- common AbstractHPolygon functions ---


"""
    addconstraint!(P::AbstractHPolygon{N},
                   constraint::LinearConstraint{N})::Void where {N<:Real}

Add a linear constraint to a polygon in constraint representation, keeping the
constraints sorted by their normal directions.

### Input

- `P`          -- polygon in constraint representation
- `constraint` -- linear constraint to add

### Output

Nothing.
"""
function addconstraint!(P::AbstractHPolygon{N},
                        constraint::LinearConstraint{N})::Void where {N<:Real}
    i = length(P.constraints)
    while i > 0 && constraint.a <= P.constraints[i].a
        i -= 1
    end
    # here P.constraints[i] < constraint
    insert!(P.constraints, i+1, constraint)
    return nothing
end

"""
    binary_search_constraints(d::AbstractVector{<:Real},
                              constraints::Vector{LinearConstraint{N}},
                              n::Int,
                              k::Int
                             )::Int where {N<:Real}

Performs a binary search in the constraints.

### Input

- `d`           -- direction
- `constraints` -- constraints
- `n`           -- number of constraints
- `k`           -- start index

### Output

The largest index `k` such that `constraints[k] <= d`.
"""
function binary_search_constraints(d::AbstractVector{<:Real},
                                   constraints::Vector{LinearConstraint{N}},
                                   n::Int,
                                   k::Int
                                  )::Int where {N}
    lower = 1
    upper = n+1
    while lower + 1 < upper
        if constraints[k].a <= d
            lower = k
        else
            upper = k
        end
        k = lower + div(upper - lower, 2)
    end
    if lower == 1 && !(constraints[1].a <= d)
        # special case for index 1
        return 1
    end
    return upper
end
