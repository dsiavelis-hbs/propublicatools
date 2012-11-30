 # Call Ruby's OpenURI module which gives us a method to 'open' a specified webpage
        require 'open-uri'

        # This is the basic address of Pfizer's all-inclusive list. Adding on the iPageNo parameter will get us from page to page.
        BASE_LIST_URL = 'http://www.pfizer.com/responsibility/working_with_hcp/payments_report.jsp?enPdNm=All&iPageNo='

        # We found this by looking at Pfizer's listing
        LAST_PAGE_NUMBER = 485

        # create a subdirectory called 'pfizer-list-pages'
        LIST_PAGES_SUBDIR = 'pfizer-list-pages'

        Dir.mkdir(LIST_PAGES_SUBDIR) unless File.exists?(LIST_PAGES_SUBDIR)

        # So, from 1 to 485, we'll open the same address on Pfizer's site, but change the last number

        for page_number in 1..LAST_PAGE_NUMBER
                page = open("#{BASE_LIST_URL}#{page_number}")

                # create a new file into to which we copy the webpage contents
                # and then write the contents of the downloaded page (with the readlines method) to this
                # new file on our hard drive
                file = File.open("#{LIST_PAGES_SUBDIR}/pfizer-list-page-#{page_number}.html", 'w')

                # write to this new html file
                file.write(page.readlines)

                # close the file
                file.close

                # the previous three commands could be condensed to:
                # File.open("#{LIST_PAGES_SUBDIR}/pfizer-list-page-#{page_number}.html", 'w'){|f| f.write(page.readlines)}


                puts "Copied page #{page_number}"
                # wait 4 seconds before getting the next page, to not overburden the website.
                sleep 4 
        end

        