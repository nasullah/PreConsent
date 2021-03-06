package de.andreasschmitt.richui

import de.andreasschmitt.richui.taglib.renderer.*

/*
*
* @author Andreas Schmitt
*/
class RichUIUtilTagLib {
	
	static namespace = "richui"
	
	Renderer feedRenderer
	
	// Redirects to another url
	def redirect = { attrs ->
		if(attrs?.url){
			response?.sendRedirect(attrs.url.toString())	
		}	
	}
	
	// Embed feed
	def feed = { attrs ->
		if(attrs?.type && attrs?.url){
			attrs.title = attrs?.title ? attrs.title: attrs?.type?.toUpperCase()
			attrs.type = "application/${attrs?.type?.toLowerCase()}+xml"	
				
			//Render output
			try {
				out << feedRenderer?.renderTag(attrs)
			}
			catch(RenderException e){
				log.error(e)
			}	
		}
		else {
			log.error("Attributes type and url are mandatory")
		}
	}
	
	// Teaser
	def teaser = { attrs ->
		try {
			int length = 30
			
			if(attrs?.length){
				length = new Integer(attrs.length)
			}
			
			if(attrs?.value){
				// Strip HTML tags
				if(attrs?.stripHtml && attrs?.stripHtml == "true"){
					attrs.value = attrs.value.replaceAll("\\<.*?>","")
				}
				
				if(attrs.value?.length() > length){
					out << attrs.value.substring(0, length) + "..."
				}
				else {
					out << attrs.value
				}
			}	
		}
		catch (NumberFormatException e){
			log.error("Error converting length to integer", e)
		}
	}
}
