Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C9A3FC0;
	Wed, 25 Aug 2021 21:39:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 5A8B73200A33;
	Wed, 25 Aug 2021 17:39:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 25 Aug 2021 17:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=fm1; bh=N41
	rumlTSLS+5bh7LXNsiOpiurFnrByyF0JvmZ5dNcM=; b=Fs/Oj0nxgKWkDVjO8rc
	ulJGAFMmzgS+W3FVRKwGXRuamKIzi9XxxazRhKJ/Q3oHbPShoAh8pDFcbGYEwQWD
	bUuHy+NTQ2Vjn/qK/l4QKhKXCA9qhwHp38pdxQ/MSe9kfmKFOnTRw1nr0Qp0w+TF
	J3OWCtsvs0jpIzvXe0/6UdsQeY+lL0Hw7U6ezGncRuZ934dutVV4OE6YTnIU0dWh
	MCcFF+K70yV4KOIjVGXrq9aNn0yhLDYwrVCwgu/Z9CyTIGslUOzRP8KtzC1pLfLp
	lQb1CLUbIkA6JMXaaYXVPx03lHV2dQBuFzzdiEjazpP/4MYQy0Jh3snUFG6ogzTH
	eMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=N41rum
	lTSLS+5bh7LXNsiOpiurFnrByyF0JvmZ5dNcM=; b=WGiFIomlhNLT6jLuArJ2mo
	0JOydSoQQYQPQFDO3pLUiUBqwEx+z34o3ESvB/4ToldL2dBGCNTMUF7084XBT6QS
	SlTNiSX4xl7jF1U+LQTgKmwYgNk7FN8WyqcCsQ1z0EkteKjtz2jSXN2ClSb3y0dU
	OuPjv4OQGxFGBP/pmbtFbZEKGGdg8ZX+M4g/sVxx7EbR2ixP2DLLSSBXeXNZcbKp
	fYgPra4w3GRonKBe8IVC0/hw9uYioYDI7uFzfqAQU2/LShqOjACHq825uPB8i2Sz
	HHeO0IgAyL6kBISswEOnMK/UxRCOg4DYrvW2HDROJM2E+TTYWDhZ5DTRopeB/A0Q
	==
X-ME-Sender: <xms:krgmYZpQGtI6-eGeqq1PaykvDbL1xFhz6KqaMV5-qa2mwBx-cBeGuA>
    <xme:krgmYbrJjDteA1D-c5WMN4x6dXse19bw9HOxR083z_go_fEriYHUCv6hCsYHZOMGp
    iM9hmLexmg9SPxYEFk>
X-ME-Received: <xmr:krgmYWNYBxOu9eNMQQvJrVuS0MYKXPz8YkjDhququ3aU9aZjbD_oFi8REKk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddutddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeflohhshhcu
    vfhrihhplhgvthhtuceojhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudegkeeitdeileehgfekvedvleffgeefteekhfevueeghefhvdff
    iedukeffieffnecuffhomhgrihhnpehpuhgslhhitgdqihhnsghogidrohhrghdpthhorh
    hprhhojhgvtghtrdhorhhgpdejfhhhiehtuhgvqhguughpjhihgihjmhhgthguihhuvgih
    lhiiohhqtheiphhtjehhvggtfehpuhhkhihpthhlmhhohhhoohifvhhhuggvgeihugdroh
    hnihhonhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehjohhshhesjhhoshhhthhrihhplhgvthhtrdhorhhg
X-ME-Proxy: <xmx:krgmYU4AsU0z1QEr-cUBTC50oroDamEKNDqwkDV8Fj0MnLOr8L156Q>
    <xmx:krgmYY75zkIGiYXWK7EVC16tcKUhnDRdz4OuCQhTDHODMXCczM5WBw>
    <xmx:krgmYchxJBobVQOxrgXOxbABJRAYGpSJI7f2fH8SuKSnsaSQIYk4sQ>
    <xmx:k7gmYYFq_il05jjGGagsOEjVkX3X4T4VOGBf7e9-1YPIsneInz8e9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Aug 2021 17:39:29 -0400 (EDT)
Date: Wed, 25 Aug 2021 14:39:29 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <YSa4kYDpTAFOf0az@localhost>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <CAL_Jsq+zxVw3BaAzF+58KT9jrFWNzUpELevj=SGPJSrdcVFPSw@mail.gmail.com>
 <20210825164459.5pxaxsl5a6nuipbt@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825164459.5pxaxsl5a6nuipbt@nitro.local>

On Wed, Aug 25, 2021 at 12:44:59PM -0400, Konstantin Ryabitsev wrote:
> Great to hear, thank you for sharing that. I've been running b4 in a loop
> against /all/ as well, and so far so good on my end, too. The plan is to
> switch over to the new lore on Monday, August 30, but I need to release b4 0.8
> first, which is needed to better work with the upstream public-inbox changes.

Would you consider applying the following patch, to improve the mobile layout
on x-lore? Without this change, the mail listing pages are much narrower than
the device screen, making them hard to read. This *should* make the pages size
perfectly to the device.

---- >8 -----
From bebb1f75e90dd25492430004fee916e92c5eec0a Mon Sep 17 00:00:00 2001
Message-Id: <bebb1f75e90dd25492430004fee916e92c5eec0a.1629927361.git.josh@joshtriplett.org>
From: Josh Triplett <josh@joshtriplett.org>
Date: Tue, 24 Aug 2021 13:00:06 -0700
Subject: [PATCH] Display shorter public-inbox.org URL in the footer, to
 improve mobile layout

The long un-wrappable onion URL in the footer causes automatic
width-detection logic in mobile browsers to make the whole page as wide
as that URL, rather than a width suitable for displaying the rest of the
content. This makes the rest of the page substantially narrower than the
device.

Display the shorter public-inbox.org URL, to make page layout look
better on mobile devices.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---
 lib/PublicInbox/WwwStream.pm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/PublicInbox/WwwStream.pm b/lib/PublicInbox/WwwStream.pm
index 2f8212d4..474b3504 100644
--- a/lib/PublicInbox/WwwStream.pm
+++ b/lib/PublicInbox/WwwStream.pm
@@ -12,8 +12,8 @@ our @EXPORT_OK = qw(html_oneshot);
 use bytes (); # length
 use PublicInbox::Hval qw(ascii_html prurl ts2str);
 our $TOR_URL = 'https://www.torproject.org/';
-our $CODE_URL = [ qw(http://7fh6tueqddpjyxjmgtdiueylzoqt6pt7hec3pukyptlmohoowvhde4yd.onion/public-inbox.git
-	https://public-inbox.org/public-inbox.git) ];
+our $CODE_URL = [ qw(https://public-inbox.org/public-inbox.git
+	http://7fh6tueqddpjyxjmgtdiueylzoqt6pt7hec3pukyptlmohoowvhde4yd.onion/public-inbox.git) ];
 
 sub base_url ($) {
 	my $ctx = shift;
-- 
2.33.0


