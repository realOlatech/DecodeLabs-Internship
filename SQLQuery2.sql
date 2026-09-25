WITH ProductAnalysis AS
(
    SELECT
        'Product' AS AnalysisType,
        Product AS Category,
        NULL AS OrderCount,
        SUM(TotalPrice) AS Revenue
    FROM [Dataset for Data Analytics (1)]
    WHERE OrderStatus = 'Delivered'
    GROUP BY Product
),

OrderStatusAnalysis AS
(
    SELECT
        'Order Status' AS AnalysisType,
        OrderStatus AS Category,
        COUNT(OrderID) AS OrderCount,
        SUM(TotalPrice) AS Revenue
    FROM [Dataset for Data Analytics (1)]
    GROUP BY OrderStatus
),

PaymentAnalysis AS
(
    SELECT
        'Payment Method' AS AnalysisType,
        PaymentMethod AS Category,
        NULL AS OrderCount,
        SUM(TotalPrice) AS Revenue
    FROM [Dataset for Data Analytics (1)]
    WHERE OrderStatus = 'Delivered'
    GROUP BY PaymentMethod
),

CustomerAnalysis AS
(
    SELECT
        'Customer' AS AnalysisType,
        CustomerID AS Category,
        NULL AS OrderCount,
        SUM(TotalPrice) AS Revenue
    FROM [Dataset for Data Analytics (1)]
    WHERE OrderStatus = 'Delivered'
    GROUP BY CustomerID
),

ReferralAnalysis AS
(
    SELECT
        'Referral Source' AS AnalysisType,
        ReferralSource AS Category,
        COUNT(OrderID) AS OrderCount,
        SUM(TotalPrice) AS Revenue
    FROM [Dataset for Data Analytics (1)]
    WHERE OrderStatus = 'Delivered'
    GROUP BY ReferralSource
)

SELECT
    AnalysisType,
    Category,
    OrderCount,
    Revenue
FROM ProductAnalysis

UNION ALL

SELECT
    AnalysisType,
    Category,
    OrderCount,
    Revenue
FROM OrderStatusAnalysis

UNION ALL

SELECT
    AnalysisType,
    Category,
    OrderCount,
    Revenue
FROM PaymentAnalysis

UNION ALL

SELECT
    AnalysisType,
    Category,
    OrderCount,
    Revenue
FROM CustomerAnalysis

UNION ALL

SELECT
    AnalysisType,
    Category,
    OrderCount,
    Revenue
FROM ReferralAnalysis

ORDER BY
    AnalysisType,
    Revenue DESC;