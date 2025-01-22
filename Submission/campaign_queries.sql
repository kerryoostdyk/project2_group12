--Count the number of campaigns in each category 

SELECT 
	campaign.category_id,
	category.category,
	count(campaign.cf_id) as campaign_num

FROM campaign
	JOIN category on category.category_id = campaign.category_id

GROUP BY
	campaign.category_id,
	category.category

ORDER BY 
	campaign_num asc


--Count the number of campaigns in each subcategory 

SELECT 
	campaign.subcategory_id,
	subcategory.subcategory,
	count(campaign.cf_id) as campaign_num

FROM campaign
	JOIN subcategory on subcategory.subcategory_id = campaign.subcategory_id

GROUP BY
	campaign.subcategory_id,
	subcategory.subcategory

ORDER BY 
	campaign_num asc


--Count the number of successful campaigns in each category 

SELECT 
	campaign.category_id,
	category.category,
	--campaign.outcome,
	count(campaign.cf_id) as campaign_num

FROM campaign
	JOIN category on category.category_id = campaign.category_id

WHERE campaign.outcome = 'successful'

GROUP BY
	campaign.category_id,
	category.category,
	campaign.outcome

ORDER BY 
	campaign_num asc


--Create a query with both total campaigns in each category and successful campaigns in each category 
--syntax help by chatgpt

SELECT 
    campaign.category_id,
    category.category,
    COUNT(*) AS total_campaigns, -- Total campaigns in each category
    COUNT(CASE WHEN campaign.outcome = 'successful' THEN 1 END) AS successful_campaigns -- Successful campaigns in each category
	
FROM campaign
	JOIN category ON category.category_id = campaign.category_id

GROUP BY
    campaign.category_id,
    category.category
	
ORDER BY 
    total_campaigns ASC;

--Now a final column with percent successful campaigns for each category
--thanks to chatgpt for the syntax help

SELECT 
    campaign.category_id,
    category.category,
    COUNT(*) AS total_campaigns, -- Total campaigns in each category
    COUNT(CASE WHEN campaign.outcome = 'successful' THEN 1 END) AS successful_campaigns, -- Successful campaigns in each category
    ROUND(
        (COUNT(CASE WHEN campaign.outcome = 'successful' THEN 1 END) * 100.0) / COUNT(*), 2) AS success_rate -- Percentage of successful campaigns, rounded to 2 decimal places
FROM campaign
JOIN category ON category.category_id = campaign.category_id
GROUP BY
    campaign.category_id,
    category.category
ORDER BY 
    success_rate ASC ;

--Only showing success_rate
SELECT 
    category.category,
    ROUND(
        (COUNT(CASE WHEN campaign.outcome = 'successful' THEN 1 END) * 100.0) / COUNT(*), 2) AS success_rate -- Percentage of successful campaigns, rounded to 2 decimal places
FROM campaign
JOIN category ON category.category_id = campaign.category_id
GROUP BY
    campaign.category_id,
    category.category
ORDER BY 
    success_rate ASC ;