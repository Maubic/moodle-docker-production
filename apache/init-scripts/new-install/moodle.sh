#!/bin/bash
# WHEN: 
# - new-install
# - update (just to fix a bug!)
# - upgrade (if new parameters needed, expected to be empty)



# Load sensitive data or configurable data from a .env file
#export $(grep -E -v '^#' /init-scripts/.env | xargs)

# Config site
moosh config-set forcetimezone UTC
moosh config-set calendar_site_timeformat %H:%M
moosh config-set calendar_startwday 1
moosh config-set debugdisplay 0
moosh config-set frontpage 6
moosh config-set frontpageloggedin 5,0




# Config smtp
echo >&2 "Configuring smtp..."
set -x
moosh config-set smtphosts ${SMTP_HOSTS}
moosh config-set smtpsecure tls
moosh config-set smtpauthtype LOGIN
moosh config-set smtpuser ${SMTP_USER}
moosh config-set smtppass ${SMTP_PASSWORD}
moosh config-set smtpmaxbulk ${SMTP_MAXBULK}
moosh config-set noreplyaddress ${NO_REPLY_ADDRESS}

# Authentication
moosh config-set authloginviaemail 0
moosh config-set allowguestmymoodle 0
moosh config-set allowaccountssameemail 1
moosh config-set guestloginbutton 0

# Licenses
moosh config-set sitedefaultlicense cc-nc-sa


# Config webservices
echo >&2 "Configuring webservices..."
moosh config-set enablewebservices 1
moosh config-set enablemobilewebservice 1

# Config blog
echo >&2 "Configuring blog..."
moosh config-set enableblogs 1

# Config mobile notifications
echo >&2 "Configuring mobile notifications..."
moosh config-set airnotifierurl https://messages.moodle.net
moosh config-set airnotifierport 443
moosh config-set airnotifiermobileappname com.moodle.moodlemobile
moosh config-set airnotifierappname commoodlemoodlemobile

# If we want to set the time when students receive mails
# moosh config-set digestmailtime 18

# Set languages
echo >&2 "Configuring languages..."
# moosh config-set doclang es
# moosh config-set lang es
moosh config-set country ES
moosh config-set timezone Europe/Madrid


# Config navigation
echo >&2 "Configuring navitation..."
moosh config-set defaulthomepage 0
moosh config-set searchincludeallcourses 1
moosh config-set navshowfullcoursenames 1
moosh config-set navshowcategories 0
moosh config-set navshowallcourses 1
moosh config-set navsortmycoursessort idnumber
moosh config-set navcourselimit 20
moosh config-set linkadmincategories 0
moosh config-set linkcoursesections 0
moosh config-set navshowfrontpagemods 0
moosh config-set frontpageloggedin 5,0



# Enable cron through web browser
echo >&2 "Configuring cron through web browser..."
moosh config-set cronremotepassword ${CRON_BROWSER_PASS}
moosh config-set cronclionly 0

# Badges config
echo >&2 "Configuring badges..."
moosh config-set badges_defaultissuercontact ${MOODLE_MANAGER}
moosh config-set badges_defaultissuername gestorae

# Users config
echo >&2 "Configuring users..."
moosh config-set enablegravatar 1
moosh config-set enableportfolios 1
moosh config-set defaultpreference_maildisplay 0
moosh config-set defaultpreference_maildigest 2
moosh config-set defaultpreference_trackforums 1
moosh config-set hiddenuserfields email
moosh config-set showuseridentity username
moosh config-set block_online_users_timetosee 10
# moosh config-set guestloginbutton 1


# import categories and courses
echo >&2 "Importing categories and courses..."
/init-scripts/${INSTALL_TYPE}/import_${SCHOOL_TYPE}_categories_and_courses.sh

# statistics
moosh config-set enablestats 1

# feeds
moosh config-set enablerssfeeds 1

# activities config
moosh config-set completiondefault 0

# courses
moosh config-set enableglobalsearch 1
moosh config-set enablecourserequests 1
moosh config-set courserequestnotify \$\@ALL@$
moosh config-set searchincludeallcourses 0

# grades
moosh config-set gradeexport ods,txt,xml
moosh config-set gradepointmax 10
moosh config-set grade_aggregation 10
moosh config-set grade_aggregations_visible 0,10,13
moosh config-set grade_report_showquickfeedback 1
moosh config-set grade_report_user_rangedecimals 2

# themes
moosh config-set allowthemechangeonurl 1

# Change language configuration

# Site Policyhandler
moosh config-set sitepolicyhandler tool_policy
moosh config-set contactdataprotectionofficer 1 tool_dataprivacy
moosh config-set showdataretentionsummary 0 tool_dataprivacy

# Creating moodle-manager
moosh user-create --password ${MANAGER_PASSWORD} --email ${MOODLE_MANAGER} --digest 2 --city Aragón --country ES --firstname Gestorae --lastname Aeducar gestorae
moosh user-assign-system-role gestorae manager