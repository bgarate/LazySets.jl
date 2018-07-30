# Common Set Representations

This section of the manual describes the basic set representation types.

```@contents
Pages = ["representations.md"]
Depth = 3
```

```@meta
CurrentModule = LazySets
DocTestSetup = quote
    using LazySets
end
```

## Balls

### Euclidean norm ball

```@docs
Ball2
dim(::Ball2)
σ(::AbstractVector{Float64}, ::Ball2{Float64})
∈(::AbstractVector{Float64}, ::Ball2{Float64})
an_element(::Ball2)
center(::Ball2)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### Infinity norm ball

```@docs
BallInf
dim(::BallInf)
σ(::AbstractVector{Float64}, ::BallInf{Float64})
∈(::AbstractVector{Float64}, ::BallInf{Float64})
an_element(::BallInf)
vertices_list(::BallInf)
center(::BallInf)
radius(::BallInf)
radius_hyperrectangle(::BallInf)
radius_hyperrectangle(::BallInf, ::Int)
```
Inherited from [`LazySet`](@ref):
* [`diameter`](@ref diameter(::LazySet))

Inherited from [`AbstractHyperrectangle`](@ref):
* `norm`

### Manhattan norm ball

```@docs
Ball1
dim(::Ball1)
σ(::AbstractVector{Float64}, ::Ball1{Float64})
∈(::AbstractVector{Float64}, ::Ball1{Float64})
an_element(::Ball1)
vertices_list(::Ball1)
center(::Ball1)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### p-norm ball

```@docs
Ballp
dim(::Ballp)
σ(::AbstractVector{Float64}, ::Ballp{Float64})
∈(::AbstractVector{Float64}, ::Ballp{Float64})
an_element(::Ballp)
center(::Ballp)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

## Ellipsoid

```@docs
Ellipsoid
dim(::Ellipsoid)
σ(::AbstractVector{Float64}, ::Ellipsoid{Float64})
∈(::AbstractVector{Float64}, ::Ellipsoid{Float64})
an_element(::Ellipsoid)
center(::Ellipsoid)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

## EmptySet

```@docs
EmptySet
∅
dim(::EmptySet)
σ(::AbstractVector{Float64}, ::EmptySet{Float64})
∈(::AbstractVector{Float64}, ::EmptySet{Float64})
an_element(::EmptySet)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

## Half-Space

```@docs
HalfSpace
LinearConstraint
dim(::HalfSpace)
σ(::AbstractVector{Float64}, ::HalfSpace{Float64})
∈(::AbstractVector{Float64}, ::HalfSpace{Float64})
an_element(::HalfSpace)
LazySets.halfspace_left(::AbstractVector{Float64}, ::AbstractVector{Float64})
LazySets.halfspace_right(::AbstractVector{Float64}, ::AbstractVector{Float64})
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

## Hyperplane

```@docs
Hyperplane
dim(::Hyperplane)
σ(::AbstractVector{Float64}, ::Hyperplane{Float64})
∈(::AbstractVector{Float64}, ::Hyperplane{Float64})
an_element(::Hyperplane)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

## Hyperrectangles

```@docs
Hyperrectangle
Hyperrectangle(;kwargs...)
dim(::Hyperrectangle)
σ(::AbstractVector{Float64}, ::Hyperrectangle{Float64})
∈(::AbstractVector{Float64}, ::Hyperrectangle{Float64})
an_element(::Hyperrectangle)
vertices_list(::Hyperrectangle)
center(::Hyperrectangle)
radius_hyperrectangle(::Hyperrectangle)
radius_hyperrectangle(::Hyperrectangle, ::Int)
high(::Hyperrectangle)
low(::Hyperrectangle)
```
Inherited from [`LazySet`](@ref):
* [`diameter`](@ref diameter(::LazySet))

Inherited from [`AbstractHyperrectangle`](@ref):
* `norm`
* `radius`

## Intervals

```@docs
Interval
dim(::Interval)
σ(::AbstractVector{Float64}, ::Interval{Float64, IntervalArithmetic.AbstractInterval{Float64}})
∈(::AbstractVector, ::Interval)
∈(::Float64, ::Interval)
an_element(::Interval)
vertices_list(::Interval)
center(::Interval)
low(::Interval)
high(::Interval)
+(::Interval, ::Interval)
-(::Interval, ::Interval)
*(::Interval, ::Interval)
```
Inherited from [`LazySet`](@ref):
* [`diameter`](@ref diameter(::LazySet))

Inherited from [`AbstractHyperrectangle`](@ref):
* `norm`
* `radius`

## Line

```@docs
Line
dim(::Line)
σ(::AbstractVector{Float64}, ::Line{Float64})
∈(::AbstractVector{Float64}, ::Line{Float64})
an_element(::Line)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

## Line segment

```@docs
LineSegment
dim(::LineSegment)
σ(::AbstractVector{Float64}, ::LineSegment{Float64})
∈(::AbstractVector{Float64}, ::LineSegment{Float64})
LazySets.halfspace_left(::LineSegment)
LazySets.halfspace_right(::LineSegment)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

## Polygons

### Constraint representation

```@docs
HPolygon
dim(::HPolygon)
σ(::AbstractVector{Float64}, ::HPolygon{Float64})
∈(::AbstractVector{Float64}, ::HPolygon{Float64})
an_element(::HPolygon)
vertices_list(::HPolygon)
tohrep(::HPolygon)
tovrep(::HPolygon)
addconstraint!(::HPolygon{Float64}, ::LinearConstraint{Float64})
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### Optimized constraint representation

```@docs
HPolygonOpt
dim(::HPolygonOpt)
σ(::AbstractVector{Float64}, ::HPolygonOpt{Float64})
∈(::AbstractVector{Float64}, ::HPolygonOpt{Float64})
an_element(::HPolygonOpt)
vertices_list(::HPolygonOpt)
tohrep(::HPolygonOpt)
tovrep(::HPolygonOpt)
addconstraint!(::HPolygonOpt{Float64}, ::LinearConstraint{Float64})
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### Vertex representation

```@docs
VPolygon
dim(::VPolygon)
σ(::AbstractVector{Float64}, ::VPolygon{Float64})
∈(::AbstractVector{Float64}, ::VPolygon{Float64})
an_element(::VPolygon)
vertices_list(::VPolygon)
tohrep(::VPolygon)
tovrep(::VPolygon)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### Sorting directions

```@docs
LazySets.jump2pi
<=(::AbstractVector{Float64}, ::AbstractVector{Float64})
LazySets.quadrant(::AbstractVector{Float64})
```

## Polytopes

### Constraint representation

```@docs
HPolytope
dim(::HPolytope)
σ(::AbstractVector{Float64}, ::HPolytope{Float64})
∈(::AbstractVector{Float64}, ::HPolytope{Float64})
addconstraint!(::HPolytope{Float64}, ::LinearConstraint{Float64})
constraints_list(::HPolytope)
tosimplehrep(::HPolytope)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### Vertex representation

```@docs
VPolytope
dim(::VPolytope)
σ(::AbstractVector{Float64}, ::VPolytope{Float64})
vertices_list(::VPolytope)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

## Singletons

```@docs
Singleton
dim(::Singleton)
σ(::AbstractVector{Float64}, ::Singleton{Float64})
∈(::AbstractVector{Float64}, ::Singleton{Float64})
an_element(::Singleton)
vertices_list(::Singleton)
center(::Singleton)
radius_hyperrectangle(::Singleton)
radius_hyperrectangle(::Singleton, ::Int)
element(::Singleton)
element(::Singleton, ::Int)
```
Inherited from [`LazySet`](@ref):
* [`diameter`](@ref diameter(::LazySet))

Inherited from [`AbstractHyperrectangle`](@ref):
* `norm`
* `radius`

## ZeroSet

```@docs
ZeroSet
dim(::ZeroSet)
σ(::AbstractVector{Float64}, ::ZeroSet{Float64})
∈(::AbstractVector{Float64}, ::ZeroSet{Float64})
an_element(::ZeroSet)
vertices_list(::ZeroSet)
center(::ZeroSet)
radius_hyperrectangle(::ZeroSet)
radius_hyperrectangle(::ZeroSet, ::Int)
element(::ZeroSet)
element(::ZeroSet, ::Int)
linear_map(::AbstractMatrix, ::ZeroSet)
```
Inherited from [`LazySet`](@ref):
* [`diameter`](@ref diameter(::LazySet))

Inherited from [`AbstractHyperrectangle`](@ref):
* `norm`
* `radius`

## Zonotopes

```@docs
Zonotope
dim(::Zonotope)
σ(::AbstractVector{Float64}, ::Zonotope{Float64})
∈(::AbstractVector{Float64}, ::Zonotope{Float64})
an_element(::Zonotope)
vertices_list(::Zonotope)
center(::Zonotope)
order(::Zonotope)
minkowski_sum(::Zonotope, ::Zonotope)
linear_map(::AbstractMatrix, ::Zonotope)
scale(::Real, ::Zonotope)
ngens(::Zonotope)
reduce_order(::Zonotope, r)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))
