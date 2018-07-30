# Common Set Operations

This section of the manual describes the basic symbolic types describing
operations between sets.

```@contents
Pages = ["operations.md"]
Depth = 3
```

```@meta
CurrentModule = LazySets
DocTestSetup = quote
    using LazySets
end
```

## Cartesian Product

### Binary Cartesian Product

```@docs
CartesianProduct
Base.:×
Base.:*(::LazySet{Float64}, ::LazySet{Float64})
dim(::CartesianProduct)
σ(::AbstractVector{Float64}, ::CartesianProduct{Float64, LazySet{Float64}, LazySet{Float64}})
∈(::AbstractVector{Float64}, ::CartesianProduct{Float64, LazySet{Float64}, LazySet{Float64}})
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### ``n``-ary Cartesian Product

```@docs
CartesianProductArray
dim(::CartesianProductArray)
σ(::AbstractVector{Float64}, ::CartesianProductArray{Float64, LazySet{Float64}})
∈(::AbstractVector{Float64}, ::CartesianProductArray{Float64, LazySet{Float64}})
array(::CartesianProductArray)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

## Convex Hull

### Binary Convex Hull

```@docs
ConvexHull
CH
dim(::ConvexHull)
σ(::AbstractVector{Float64}, ::ConvexHull{Float64, LazySet{Float64}, LazySet{Float64}})
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### ``n``-ary Convex Hull

```@docs
ConvexHullArray
CHArray
dim(::ConvexHullArray)
σ(::AbstractVector{Float64}, ::ConvexHullArray)
array(::ConvexHullArray)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### Convex Hull Algorithms

```@docs
convex_hull
convex_hull!
right_turn
monotone_chain!
```

## Intersection

### Binary Intersection

```@docs
Intersection
∩(::LazySet, ::LazySet)
dim(::Intersection)
σ(::AbstractVector{Float64}, ::Intersection{Float64, LazySet{Float64}, LazySet{Float64}})
∈(::AbstractVector{Float64}, ::Intersection{Float64, LazySet{Float64}, LazySet{Float64}})
isempty(::Intersection)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### ``n``-ary Intersection

```@docs
IntersectionArray
dim(::IntersectionArray)
σ(::AbstractVector{Float64}, ::IntersectionArray{Float64, LazySet{Float64}})
array(::IntersectionArray)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

## Minkowski Sum

### Binary Minkowski Sum

```@docs
MinkowskiSum
⊕
Base.:+(::LazySet{Float64}, ::LazySet{Float64})
dim(::MinkowskiSum{Float64, LazySet{Float64}, LazySet{Float64}})
σ(::AbstractVector{Float64}, ::MinkowskiSum{Float64, LazySet{Float64}, LazySet{Float64}})
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### ``n``-ary Minkowski Sum

```@docs
MinkowskiSumArray
dim(::MinkowskiSumArray)
σ(::AbstractVector{Float64}, ::MinkowskiSumArray{Float64, LazySet{Float64}})
array(::MinkowskiSumArray)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### ``n``-ary Minkowski Sum with cache

```@docs
CacheMinkowskiSum
dim(::CacheMinkowskiSum)
σ(::AbstractVector{Float64}, ::CacheMinkowskiSum{Float64, LazySet{Float64}})
array(::CacheMinkowskiSum)
forget_sets!(::CacheMinkowskiSum)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

## Maps

### Linear Map

```@docs
LinearMap
*(::AbstractMatrix, ::LazySet)
*(::Float64, ::LazySet)
dim(::LinearMap)
σ(::AbstractVector{Float64}, ::LinearMap{Float64, Float64})
∈(::AbstractVector{Float64}, ::LinearMap{Float64, Float64})
an_element(::LinearMap)
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

### Exponential Map

```@docs
ExponentialMap
dim(::ExponentialMap)
σ(::AbstractVector{Float64}, ::ExponentialMap{Float64, LazySet{Float64}})
∈(::AbstractVector{Float64}, ::ExponentialMap{Float64, LazySet{Float64}})
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

```@docs
ExponentialProjectionMap
dim(::ExponentialProjectionMap)
σ(::AbstractVector{Float64}, ::ExponentialProjectionMap{Float64, LazySet{Float64}})
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

```@docs
SparseMatrixExp
*(::SparseMatrixExp{Float64}, ::LazySet{Float64})
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

```@docs
ProjectionSparseMatrixExp
*(::ProjectionSparseMatrixExp{Float64}, ::LazySet{Float64})
```
Inherited from [`LazySet`](@ref):
* [`norm`](@ref norm(::LazySet))
* [`radius`](@ref radius(::LazySet))
* [`diameter`](@ref diameter(::LazySet))

## Symmetric Interval Hull

```@docs
SymmetricIntervalHull
dim(::SymmetricIntervalHull)
σ(::AbstractVector{Float64}, ::SymmetricIntervalHull{Float64, LazySet{Float64}})
an_element(::SymmetricIntervalHull{Float64, LazySet{Float64}})
```
Inherited from [`LazySet`](@ref):
* [`diameter`](@ref diameter(::LazySet))

Inherited from [`AbstractHyperrectangle`](@ref):
* `norm`
* `radius`
