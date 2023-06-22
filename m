Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483703D67
	for <tools@linux.kernel.org>; Thu, 22 Jun 2023 20:51:25 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7624e8ceef7so636107485a.2
        for <tools@linux.kernel.org>; Thu, 22 Jun 2023 13:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687467084; x=1690059084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UJVK3pLw5aCUf/ABGnBV8SiZaRxQzq6B56yH7oSb9mE=;
        b=CDNey37r3F6YOwQkOfpvXX10mvtWOeNU1SGBTVSveDMp0JiyA/S5LrGlKpA2DLAFLg
         SJILWxBjgaeaf3OWYngVV+67DkLMX1foNxCl7uhJwwpGcl63u78qInLCJuJFs8yaMtsv
         djqp60NFocfuPV7xl3/FgDV6XT1gy2GThvH6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467084; x=1690059084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJVK3pLw5aCUf/ABGnBV8SiZaRxQzq6B56yH7oSb9mE=;
        b=UZK1em+G1eTgsY6Xl4CvkV0IjCeY31k+tFhVQ2wyY3aMyxtya7I7lADDQNtGhKeE75
         PFQp2wlEe+DqAyLvLgvHdGQ+BIa3vicNh89+TX0tz2Z1fhZt390GoGZw5rA4daynyh9G
         lkgGwl4AYfO7z9o41aNZR9ym6KIR9C6LJvGXZH9V2gWvC4i2sRiHNCgZR1BZrp4RyHIk
         XpTF+xYnPpZqPS42DzwK0WuMf5UJfbd4v+q95oQxC2bl/yLRepLA9Y8eMusuY2b5NK5t
         JgeGLO7AxuWZyUTvdtiuDBON0QTZMA09Gqt2wvWXjsNA9eOei66C24x5Zz8kFtXXG4TW
         YUBA==
X-Gm-Message-State: AC+VfDyKqLpxVnzTCbTUj1rbBUjqdE5FC4QV08/7yc8cQAgGdFBQsgAa
	TOIQ+22mGYgn1eWOIELfIcQJro+UD8+BPBEimzA=
X-Google-Smtp-Source: ACHHUZ7Q9OM51tQVEFm9/vJPCXHLDqo1g75OdRbu7KVWSip6TvYf+DjzjVB14PucLOUs4uymO1GKnA==
X-Received: by 2002:a05:620a:6181:b0:763:a20f:b55b with SMTP id or1-20020a05620a618100b00763a20fb55bmr10727375qkn.9.1687467084013;
        Thu, 22 Jun 2023 13:51:24 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id p23-20020a05620a15f700b0075d49ce31c3sm3791295qkm.91.2023.06.22.13.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:51:23 -0700 (PDT)
Date: Thu, 22 Jun 2023 16:51:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Josselin Poiret <dev@jpoiret.xyz>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] Quote author name when creating am message.
Message-ID: <20230622-facelift-precook-d9ca32@meerkat>
References: <5de6864e5999c398700712fdce5d52c77d8b0a2a.1686057776.git.dev@jpoiret.xyz>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5de6864e5999c398700712fdce5d52c77d8b0a2a.1686057776.git.dev@jpoiret.xyz>

On Tue, Jun 06, 2023 at 03:23:18PM +0200, Josselin Poiret wrote:
> From: Josselin Poiret <dev@jpoiret.xyz>
> 
> Previously, if an author name needed to be quoted, `git am` would create an mbox
> with invalid From: lines, such as with [1].  Escape author name in all cases.

Thank you for the report. I didn't take the patch, because there is a better
way to do it, but I did give you credit in the commit:

https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=87aacf279afc3c1eda7b2e6e02e70842b4f99bc7

Best regards,
Konstantin
