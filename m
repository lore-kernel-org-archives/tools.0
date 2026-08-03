Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC003264CA
	for <tools@linux.kernel.org>; Mon,  3 Aug 2026 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785771315; cv=pass; b=KAsi8cWc3fWuGzRoNPliF+PBFBgfxCwo6DoiynDn2dvKVcREzK5wQ8GjCgkgxmqLxUaGIDXHa28NQvF0BJ4eBSoZBuIzfJZCr1HL7OT/pplz+KXqufjtKulux/gt9X2+CS/MXzh/B371cX4TPMJSFL5m4PAOmlluPxKBsuquDdc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785771315; c=relaxed/simple;
	bh=d8gm/4K8wMVyRcNTw7eDWrTt3JYOOJE7wy8GlZJ7bWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TI0gelE4YySd9ylPcJyEusHQJpWQdlvVYd1TWgbHjMUgU5a0yg68R1bzlY7pKcIzGFAVLlptdW3xhC5eiAc8d0NIgdyVrJXx5Rm91VXL4/nXdQDAfAMjWdbKNdM3aVjJ52qHkfNoSkHhPhCAfyA/0KqmnQPVov5zUVLVUEHum8c=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=YrMs1+hs; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="YrMs1+hs"
Received: by smtp.kernel.org (Postfix)
	id 0C4471F00A3A; Mon,  3 Aug 2026 15:35:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.15
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1785771314;
	b=XVnqKtmNfUwMkJwg4WOIJvP3nmXBopooE+DshE0SeLuziQwxaSx1wd8B73LtKFeI1pCm
	 lXcVNqt4CunD5Zgwpaa770BUcLHgYlgCgAAFK4zQr6GejNQ6yWlwromWZzlSFvtuTfucn
	 3rnzvR0iIEjAhscAa/2IbrfarAAFEyZ4sloEe3WwOLPlptBztoto+aU5MnJZ3JJ6NYIzl
	 gvdbo6pYOYbA8rwP/SrKJ+517EeUOpmEQcLUZ0FCgzTzvFGF0ep/FtI+DckN3hV487CFj
	 WzSe/EH2Lnc5tv4BsFCQChPZPGrzNIr6iD/iZ1yAsHRSFw0brCffuBUroeSOsgCgf8w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785771314;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-ZohoMailClient;
	bh=EBfIu55+DLjwKLqVqNLTYskT9b50wmLBQL+2sfpjYaU=;
	b=lQ1QCrp+7myUXsQ+/If8/Tri93zPw6W2YhhzFBc8hAn7wisJDT/5ahq2nzQ0Q3Gr2iTf
	 sZoJ5A9QJozuc8mk1tlC9h4B4m3ZS5YKNPjMsHtEHtG6j3qAAdaw/Nlk56kM3bY/36yFO
	 aiSDfrt3Zs6d7vK0Nh1a1BJrYfAmuwgeiUTm3125+SiczW7KEi5mvfQXA6wLOzzodmv1m
	 Rmle3dFUwWpYDgvygBbTs5SBavCvhdOoDpUS5AP2O5WZ3q+iBa1qj4zNdaLYDAi3uURcB
	 TgPUTtwnexDA8q501l7tmOgPcV85CTbpDJ8N7itXfKOcyuwYycKlAsQDSjNGd719Yew==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=ritovision.com header.i=rito@ritovision.com header.a=rsa-sha256 header.s=zmail header.b=YrMs1+hs;
	dmarc=pass header.from=ritovision.com;
	spf=pass smtp.mailfrom=ritovision.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.15
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E3EA1F000E9;
	Mon,  3 Aug 2026 15:35:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ritovision.com header.i=rito@ritovision.com header.a=rsa-sha256 header.s=zmail header.b=YrMs1+hs
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0E3EA1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1785771310; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dEran2tL1PyTnRupCJbCr5pMTho46Vi+hhMMMH2ZVMSrwSKJGBfmMmPrCb3DQMy+N+Fu3py+7awclbSLZAZl7qi7olarvRpd/dqp3ppZVQ6fuwRJgfgaGSTFBqbrS1p74vYO7bv/PXq7qAqByXsXw28pI3u3nExzYlNQJBDXvuU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785771310; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EBfIu55+DLjwKLqVqNLTYskT9b50wmLBQL+2sfpjYaU=; 
	b=AL8ViJEXp7Ihs7V5PR29LQJGw8maWQ3BsWviHDaAIK5VrFDKguUmnz8lqKLeNdusePL2xYgGglCa1eThBaqq3N9A8a0axfR1FvtB5L3aPIOn5SSW+xvkXLiLU1mrBWOk1qaSSrP492tIsZ9dw2D1j+ZdG88n9/C6sB3IMdqM2Mw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785771310;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=EBfIu55+DLjwKLqVqNLTYskT9b50wmLBQL+2sfpjYaU=;
	b=YrMs1+hsxtvdUgXYCq4GL9sR7Pihlu7eYOvigHkO2BuTbNfUbr54v9lyLD5+TXAI
	4LfLd4lPLyvMDhM3sG3K2Hc0qKHniSVSg3TwMqCkiDPfu97T/URqUIYV6ML8JUN6bX+
	1VxF4HJd9CCv2e1OyaRZttfo4yctmqPHLiiho2qI=
Received: by mx.zohomail.com with SMTPS id 1785771306651134.28564954159526;
	Mon, 3 Aug 2026 08:35:06 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: tools@kernel.org
Cc: Konstantin Ryabitsev <mricon@kernel.org>,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v1 1/2] add mobile drawer navigation with a compact sticky top bar
Date: Mon,  3 Aug 2026 11:35:01 -0400
Message-ID: <20260803153502.32096-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On small screens the navigation wraps into a dense block of links that
is hard to scan and gives closely spaced tap targets, the banner
consumes significant vertical space, and because content reflows into a
single narrow column, returning to the navigation at the top of the page
is a much longer scroll than on desktop.

At the mobile breakpoint, hide the desktop banner/navigation and replace
it with a compact sticky top bar carrying the same site title and logo.
Add a hamburger control that opens a drawer menu with overlay, so
navigation is reachable at any scroll position without returning to the
top. It is driven by a checkbox/label toggle, so no JavaScript is
required. All rules are scoped to the 848px media query; the desktop
layout is unchanged.

The checkbox is the only keyboard-operable control, so it is hidden with
clip-path rather than display:none to keep it focusable, and Space
toggles the drawer. The labels are pointer affordances only, marked
aria-hidden and given no tabindex: a label does not respond to Enter or
Space, so making it focusable would present a control that cannot be
operated. Focus rings are drawn on whichever affordance is visible,
moving to the close icon once the open drawer paints over the hamburger.
The closed drawer is set visibility:hidden so its off-screen links stay
out of the tab order.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: LLM [codegen, review]
---
 korgi/static/css/main.css | 164 ++++++++++++++++++++++++++++++++++++++
 korgi/templates/base.html |  30 +++++++
 2 files changed, 194 insertions(+)

diff --git a/korgi/static/css/main.css b/korgi/static/css/main.css
index 95b6326..60538d9 100644
--- a/korgi/static/css/main.css
+++ b/korgi/static/css/main.css
@@ -339,7 +339,171 @@ dt {
     padding-bottom: 22px;
 }
 
+/* Mobile nav: hidden on desktop. The toggle, overlay and drawer all
+   live inside #mobile-banner, so hiding it hides the whole control. */
+#mobile-banner { display: none; }
+
 @media screen and (max-width: 848px) {
+    #banner {
+        display: none;
+    }
+    /* The checkbox is the actual control, so it stays reachable by
+       keyboard; only its rendering is suppressed. The labels are
+       pointer affordances and are hidden from assistive tech. */
+    .mobile-nav-checkbox {
+        display: block;
+        position: absolute;
+        width: 1px;
+        height: 1px;
+        margin: 0;
+        padding: 0;
+        border: 0;
+        overflow: hidden;
+        clip-path: inset(50%);
+    }
+    .mobile-nav-checkbox:focus-visible ~ .hamburger-btn,
+    .mobile-nav-checkbox:focus-visible:checked ~ #mobile-drawer .close-btn svg {
+        outline: 2px solid #3357D6;
+        outline-offset: 2px;
+        border-radius: 0.2em;
+    }
+    /* While open the drawer paints over the hamburger, so the ring
+       would be hidden; show it on the close control instead. */
+    .mobile-nav-checkbox:focus-visible:checked ~ .hamburger-btn {
+        outline: none;
+    }
+    #mobile-banner {
+        display: flex;
+        align-items: center;
+        position: sticky;
+        top: 0;
+        z-index: 1000;
+        background: #FFFFFF;
+        padding: 0.5em 1em;
+        border-bottom: thin solid #CCC8B8;
+        box-shadow: 0 0.1em 0.3em #CCC8B8;
+    }
+    #mobile-tux-gear {
+        width: 2.5em;
+        height: 3em;
+        background-image: url('../images/logos/tux.png');
+        background-position: center;
+        background-repeat: no-repeat;
+        background-size: contain;
+        flex-shrink: 0;
+    }
+    #mobile-banner .mobile-site-title {
+        flex: 1;
+        margin: 0 0.5em;
+        font-family: oswald,helvetica,sans-serif;
+        font-weight: bold;
+        font-size: 1.4em;
+        line-height: 1.1;
+        text-shadow: 2px 2px 0 #F8F4EE;
+    }
+    #mobile-banner .mobile-site-title > a {
+        color: #2C1D00;
+        transition: none;
+    }
+    .hamburger-btn {
+        cursor: pointer;
+        flex-shrink: 0;
+        padding: 0.25em;
+    }
+    .hamburger-btn svg {
+        display: block;
+    }
+    #mobile-drawer {
+        display: block;
+        position: fixed;
+        top: 0;
+        right: 0;
+        width: 200px;
+        max-width: 75vw;
+        height: 100%;
+        background: #FFFFFF;
+        z-index: 1002;
+        transform: translateX(100%);
+        /* visibility keeps the off-screen links out of the tab order
+           while closed; it is delayed so the slide-out still animates. */
+        visibility: hidden;
+        transition: transform 0.3s ease, visibility 0s linear 0.3s;
+        overflow-y: auto;
+        box-shadow: -2px 0 8px rgba(0, 0, 0, 0.2);
+    }
+    #mobile-drawer ul {
+        list-style: none;
+        padding: 1em;
+        margin: 0;
+    }
+    #mobile-drawer li {
+        padding: 0.75em 0;
+        border-bottom: thin solid #F0EDE3;
+    }
+    #mobile-drawer li:last-child {
+        border-bottom: none;
+    }
+    #mobile-drawer li > a {
+        font-family: oswald, helvetica, sans-serif;
+        font-size: 1.1em;
+        color: #B39223;
+    }
+    #mobile-drawer li > a:hover,
+    #mobile-drawer li > a:active {
+        color: #4C3D00;
+    }
+    #drawer-tux {
+        width: 4em;
+        height: 5em;
+        margin: 1.5em auto 1em;
+        background-image: url('../images/logos/tux.png');
+        background-position: center;
+        background-repeat: no-repeat;
+        background-size: contain;
+    }
+    .close-btn {
+        display: block;
+        cursor: pointer;
+        text-align: right;
+        padding: 1em;
+    }
+    .close-btn svg {
+        display: inline-block;
+    }
+    .nav-overlay {
+        display: block;
+        position: fixed;
+        top: 0;
+        left: 0;
+        right: 0;
+        bottom: 0;
+        background: rgba(0, 0, 0, 0.5);
+        z-index: 1001;
+        opacity: 0;
+        visibility: hidden;
+        transition: opacity 0.3s ease, visibility 0s linear 0.3s;
+    }
+    #mobile-nav-toggle:checked ~ #mobile-drawer {
+        transform: translateX(0);
+        visibility: visible;
+        transition: transform 0.3s ease, visibility 0s;
+    }
+    #mobile-nav-toggle:checked ~ .nav-overlay {
+        opacity: 1;
+        visibility: visible;
+        transition: opacity 0.3s ease, visibility 0s;
+    }
+    /* Drop the slide and fade, but keep the visibility swap so the
+       closed drawer stays out of the tab order. */
+    @media (prefers-reduced-motion: reduce) {
+        #mobile-drawer,
+        #mobile-nav-toggle:checked ~ #mobile-drawer,
+        .nav-overlay,
+        #mobile-nav-toggle:checked ~ .nav-overlay {
+            transition: none;
+        }
+    }
+
     #banner {
         width: auto;
         margin: 0;
diff --git a/korgi/templates/base.html b/korgi/templates/base.html
index ce1d5fb..76448bc 100644
--- a/korgi/templates/base.html
+++ b/korgi/templates/base.html
@@ -46,6 +46,36 @@
                 {% endfor %}
                 </ul></nav>
         </header><!-- /#banner -->
+        <header id="mobile-banner" class="body">
+                <div id="mobile-tux-gear"></div>
+                <h1 class="mobile-site-title"><a href="{{ SITEURL }}/">{{ SITENAME }}</a></h1>
+                <input type="checkbox" id="mobile-nav-toggle" class="mobile-nav-checkbox" aria-label="Navigation menu" />
+                <label for="mobile-nav-toggle" class="hamburger-btn" aria-hidden="true">
+                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#2C1D00" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="3" y1="6" x2="21" y2="6"/><line x1="3" y1="12" x2="21" y2="12"/><line x1="3" y1="18" x2="21" y2="18"/></svg>
+                </label>
+
+                <label for="mobile-nav-toggle" class="nav-overlay" aria-hidden="true"></label>
+
+                <nav id="mobile-drawer" role="navigation" aria-label="Mobile navigation">
+                <label for="mobile-nav-toggle" class="close-btn" aria-hidden="true">
+                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="#2C1D00" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
+                </label>
+                <ul>
+                {% for title, link in MENUITEMS %}
+                    <li><a href="{{ link }}">{{ title }}</a></li>
+                {% endfor %}
+                {% if DISPLAY_PAGES_ON_MENU %}
+                {% for page in PAGES %}
+                    <li><a href="{{ SITEURL }}/{{ page.url }}">{{ page.title }}</a></li>
+                {% endfor %}
+                {% endif %}
+                {% for cat, null in categories %}
+                    <li><a href="{{ SITEURL }}/{{ cat.url }}">{{ cat }}</a></li>
+                {% endfor %}
+                </ul>
+                <a href="{{ SITEURL }}/"><div id="drawer-tux"></div></a>
+                </nav><!-- /#mobile-drawer -->
+        </header><!-- /#mobile-banner -->
         {% block content %}
         {% endblock %}
         <section id="extras" class="body">
-- 
2.51.0

