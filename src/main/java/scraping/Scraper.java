package scraping;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class Scraper {

    public static void main(String[] args) throws Exception {

        int counter = 1;
        final Document document = Jsoup.connect("http://www.imdb.com/chart/top").get();
        System.out.println(document.select("table.chart.full-width tr"));
        for (Element row : document.select("table.chart.full-width tr")) {
                final String title = row.select(".titleColumn a").text();
                final String rating = row.select(".imdbRating").text();

                System.out.println(counter+"  "+title + " -> Rating: " + rating);
                counter++;
                if(counter > 250){
                    break;
                }
        }
    }
}