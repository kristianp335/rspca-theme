<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">
	<head>
		<title>${the_title} - ${company_name}</title>

		<meta content="initial-scale=1.0, width=device-width" name="viewport" />
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
		<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
		<@liferay_util["include"] page=top_head_include />
	</head>

	<body class="${css_class}">
		<@liferay_ui["quick-access"] contentId="#main-content" />

		<@liferay_util["include"] page=body_top_include />
		
	<#if user.getScreenName()?contains("test")   >
		<@liferay.control_menu />
	</#if>
	<#if user.getScreenName()?contains("kennel")  >
		<script>
			
				$("body").removeClass();
			
		</script>
	</#if>

		<div id="wrapper">
			<header id="banner" role="banner">
				<div class="container-fluid-1280">
					<nav class="navbar">
						<div class="navbar-header">
							<a class="navbar-custom navbar-brand ${logo_css_class}" href="${site_default_url}" rel="home" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
								<img alt="${logo_description}" height="${company_logo_height}" src="${site_logo}" width="${company_logo_width}" />

								<#if show_site_name>
									<span class="navbar-custom navbar-brand site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
										${site_name}
									</span>
								</#if>
							</a>


							<button class="collapsed navbar-toggle" data-target="#navigationCollapse" data-toggle="collapse" type="button">
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>

						<#if has_navigation && is_setup_complete>
							<#include full_templates_path + "/navigation.ftl">
						</#if>
					<#if !is_signed_in>
						<script>
						$("<li class='lfr-nav-item'><a data-redirect='${is_login_redirect_required?string}' href='${sign_in_url}' rel='nofollow'> Sign in </a></li>").appendTo(".nav.navbar-blank.navbar-nav.navbar-site");
						</script>
					</#if>
					
						
						
						
					<#if is_signed_in>										
									<#assign
										sign_out_text = "sign out"
										sign_out_url = htmlUtil.escape(theme_display.getURLSignOut())
									/>
									<script>
										$("<li class='lfr-nav-item'><a href='${sign_out_url}'><span> sign out </span> </a> </li>").appendTo(".nav.navbar-blank.navbar-nav.navbar-site");
									</script>
					</#if>
					</nav>
				
				</div>	
								
				<#if the_title?contains("Home") || the_title?contains("Welcome") >
					<div class="intro-text">
					<div class="intro-lead-in">Benefit from rescuing an animal today!</div>
					<div class="intro-heading">Dog helps owner through illness</div>
					<a href="#services" class="page-scroll btn btn-xl">Read the story...</a>
				</#if>
			</header>
				

			<main id="content" role="main">
				<h1 class="hide-accessible">${the_title}</h1>

				<#if selectable>
					<@liferay_util["include"] page=content_include />
				<#else>
					${portletDisplay.recycle()}

					${portletDisplay.setTitle(the_title)}

					<@liferay_theme["wrap-portlet"] page="portlet.ftl">
						<@liferay_util["include"] page=content_include />
					</@>
				</#if>
			</main>

			<footer id="footer" role="contentinfo">
				<div class="container-fluid-1280" id="company-info">
					<div class="text-center" id="footer-brand">
						<img alt="${logo_description}" height="${company_logo_height}" src="${site_logo}" width="${company_logo_width}" />
					</div>

					

					<#include "${full_templates_path}/social_media.ftl" />
				</div>

				<div class="container-fluid-1280">
					<p id="copyright">
						<small><@liferay.language key="powered-by" /> <a href="http://www.liferay.com" rel="external">Liferay</a></small>
					</p>
				</div>
			</footer>
		</div>

		<@liferay_util["include"] page=body_bottom_include />

		<@liferay_util["include"] page=bottom_include />
	</body>
</html>