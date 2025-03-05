Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D68124EF93
	for <tools@linux.kernel.org>; Wed,  5 Mar 2025 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741189267; cv=none; b=PLuwOiK8Alznb35x3VkP3Re4Ru9cQoJ84jYXhtt8RV15tavlYaXmKD7MKKkt+2jTpG1esMWX0XsxZN1rI7+DCoAmd9R0G0IQdrjRqznjwlzmzPq8tM78Bu3pbvmZQKqOUySsej3AeOuMtsx5vpWH8DjYK5XhWPKbRITARN1aaLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741189267; c=relaxed/simple;
	bh=UW1TYGzCR8O7Y++AjAkVOzVJ2wqOgE6ED2y02aMSSdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMGgVyDPhP+stxfhBm2YrWYlV5iQxFCyC2TM5qi0mSHKdhqsu/fo5HBTy6/lKGKbEp7nVYGK50yLOtyzd/Dfc4VGTrjzketd5UEE8oVsHseparuRAQv6TDTLXWmyVG7zsHG0N2KEoICQPG0Bxc7Ek9pIijlM1HhtCWo54Z1Eg4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=iiW75dBc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="iiW75dBc"
Received: by smtp.kernel.org (Postfix)
	id B5F41C4CED1; Wed,  5 Mar 2025 15:41:06 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07159C4CEE2
	for <tools@kernel.org>; Wed,  5 Mar 2025 15:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07159C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6fd9d9ae47cso15008007b3.3
        for <tools@kernel.org>; Wed, 05 Mar 2025 07:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741189262; x=1741794062; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tJZyFfBlJHa6K3QE9O4CDV6QOPX/K9x1kRQ/XIFeu4g=;
        b=iiW75dBcCKNgiVdIZseX8fUPtMINFk4NoBjIU+467wEsoQfLdkZYDv8gTc8pMPZLl1
         B3imEOM+sgfwwdknyM1qfDvdl1iVMUCyGpJ53q73IeGb8yGOf+28pgDVqrnKe+BDXHjL
         Yq77IehM3vVZaONd8DceOrUaqyTTNMqfzL8Uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741189262; x=1741794062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJZyFfBlJHa6K3QE9O4CDV6QOPX/K9x1kRQ/XIFeu4g=;
        b=q205tJOgmYz2aEuNALMdYo3/xIeXPE4cMmjagD/j1L0KuIdHFnPIKNxyclHkbEEICz
         ux+czYZGSlJhwGHfhekc2yHu46BUFL78CWoZogfKwa3UQHA+2g+tpUbozKHSe3ejLjEO
         OeuGKqeg8UNpjL90RkWi1O6BZ8f9oPNGad86KKQ0hY0RFR8OnQ4s3TaGRP2jMkT3uXBU
         m2lm3m29krGBV9uraBKPSf8nwA29ENYaGxEWFOcU3Tkyi1VpVwBi3xsuQZXr/x+Efccq
         LX5+sDmxYorWYkpo/iYybvEp17AEawXClIBXxsPruEdxWf9YHfgcHCmSCGtUz0eRqImY
         u/gg==
X-Gm-Message-State: AOJu0YyUqmFP9xPEX4xsCYCoWYUs9G/wr22nLAMr/DAQhaEMNZAA3XBF
	LZvSJxpEm2RivSYEquCj9gJSw4RwO7UVt7lUTcXnVZVa25y1SVmQ/ipp2O4dJY8=
X-Gm-Gg: ASbGncssqdi889YZ9l6tsWjVdPIdZqwkyyW6jzgKw99f8U/+ZYJK3qlTV/kJuLTP5vD
	+6o8oQwX9iNcP33OYzLe5IK44QvxREavoMNIp75qJOEpMTv4Zna5UCBzUP8EeJW5DMEgZyZusAB
	TAe0cjeYoaIZl6axoj89VeFDEQt+7rom7ORFSzeSWB7aqNu5yjYeWkbgdMeIGmETczTaqRH0qu8
	eP3FzPrgLhs9i+MvnvFu2eq8q2otf3DhJeB0wNsojqgQoqecyr5xHeUt/guMSZjBdmlzQOLPptC
	jOWKHgr79LMr/800XhnKS5+NI5Yc1GPhVpcmLSpSOd2CZA==
X-Google-Smtp-Source: AGHT+IEg71i2JA+5AFNB+f6uOOlsmuxCn8VN8344ANavAIJ9jc+z6Qcpur8o48wxPlyPDIrvHQDxBw==
X-Received: by 2002:a05:690c:7209:b0:6fb:4fee:6044 with SMTP id 00721157ae682-6fda304633dmr57189157b3.15.1741189261844;
        Wed, 05 Mar 2025 07:41:01 -0800 (PST)
Received: from bill-the-cat ([187.192.142.234])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6fd3ca0f4c3sm29629567b3.14.2025.03.05.07.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:41:01 -0800 (PST)
Date: Wed, 5 Mar 2025 09:40:59 -0600
From: Tom Rini <trini@konsulko.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: Re: b4 feature request
Message-ID: <20250305154059.GO2640854@bill-the-cat>
References: <20250305145121.GM2640854@bill-the-cat>
 <20250305-amiable-banana-scallop-167f8a@lemur>
 <20250305152549.GN2640854@bill-the-cat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305152549.GN2640854@bill-the-cat>
X-Clacks-Overhead: GNU Terry Pratchett

On Wed, Mar 05, 2025 at 09:25:49AM -0600, Tom Rini wrote:
> On Wed, Mar 05, 2025 at 10:01:51AM -0500, Konstantin Ryabitsev wrote:
> > On Wed, Mar 05, 2025 at 08:51:21AM -0600, Tom Rini wrote:
> > > Hey,
> > > 
> > > So I used "b4 shazam -P 1-2" to apply part of a series, and then "b4 ty"
> > > to thank for it, and then the contributor asked if there was some way to
> > > note what parts were applied. Could something like that be added?
> > > Thanks!
> > 
> > Hmm... That's the default behaviour. E.g. see:
> > https://lore.kernel.org/all/174109571262.102031.5467613849616675528.b4-ty@linaro.org/
> > 
> > Have you modified your template to remove the enumeration?
> 
> Ah, yes, I did. And I looked around and now missed how to get the
> current default template so I can re-do the one I made back in 2022.
> 
> Maybe a sentence where the defaults are could be on
> https://b4.docs.kernel.org/en/latest/maintainer/ty.html#editing-the-templates

I found the template, and did a diff, and I don't see why my partial
replies are different.

--- /home/trini/.thanks-am-template.txt	2022-01-19 13:24:34.923048784 -0600
+++ /home/trini/.local/share/pipx/venvs/b4/lib/python3.12/site-packages/b4/templates/thanks-am-template.example	2024-10-14 13:07:25.006475280 -0600
@@ -6,7 +6,6 @@
 # Keeping it short and sweet is preferred.
 #
 On ${sentdate}, ${fromname} wrote:
-
 # quote will be limited to 5-6 lines, respecting paragraphs
 ${quote}
 
@@ -22,7 +21,7 @@
 #   fetch = ...
 #   b4-treename = uname/sound.git
 #   b4-commit-url-mask = https://git.kernel.org/uname/sound/c/%.8s
-Applied to ${treename}/${branch}, thanks!
+Applied to ${branch}, thanks!
 
 # for patch series, the summary is a list of each patch with a link
 # to the commit id in your tree, so you probably want to set
@@ -32,7 +31,9 @@
 #
 # Check this page for info on convenient URL shorteners:
 # https://korg.wiki.kernel.org/userdoc/git-url-shorterners
-#${summary}
+${summary}
+
+Best regards,
 -- 
 # if ~/.signature exists, it will be put here, otherwise
 # the contents will be "user.name <user.email>" from gitconfig

Is the difference and
[b4]
	treename = "u-boot-test-hooks"
	thanks-am-template = /home/trini/.thanks-am-template.txt
	thanks-pr-template = /home/trini/.thanks-pr-template.txt

Is the non-pw part of my .git/config for the tree for what I linked
originally.

-- 
Tom
