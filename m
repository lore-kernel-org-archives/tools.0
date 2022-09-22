Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5655B2CA2
	for <tools@linux.kernel.org>; Thu, 22 Sep 2022 20:29:35 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id g12so7194107qts.1
        for <tools@linux.kernel.org>; Thu, 22 Sep 2022 13:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=l8r/wDGz2UjOV2FgN5ERj2wOOLNlrhmG0sJIHUbgdT0=;
        b=bFpK5EkzysqlBiAPPWtXGegRkdinAzIwqaRgxloKTmDCVyjf43/BENovRHC5W3tCcm
         lC25Gf1Ly3vxTcui+MjYedqJ4t30fqQkzeIZuPAQzes3GwtpPk4RRDyIiPlH7HgVI5KY
         flxRQ89haf4PtSZSpoeYPNrTqBczrHxbx7FiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=l8r/wDGz2UjOV2FgN5ERj2wOOLNlrhmG0sJIHUbgdT0=;
        b=Z2lY66C7PFO8pTzkcaxP+v/geuIKDyW7hdMNFftMDzb29TBwkSGTRhNa3UegVuZl5u
         V5PuZmzl1P29vy2+eTeLiOHKAAvFVJdQTLcn9vY7GYvlyqWVd/yGgipshlKP+CP340A3
         1mpvlVjVTZkVVg1ltz5H53OW2AVYuDn8Dq/Ahcmr63SQnQkdy937/qLqBE/ib15wi3+S
         hTHShEqUqQWxNi5ZdnR09JJpdZbbXG2vXPH37X7CBz3Eu8VgcfMqGz0R6P0LXtISPl34
         4pDvuLa2kr9g0Wbsa6AMZCEbC+SWxwRdvJkl1FYDKco6hiaEhvWU/MZbeC4zUY7Dqs0w
         Ld7w==
X-Gm-Message-State: ACrzQf27p/F2pxqV4PXjMT1nhz5+zgnWqZqZmab5fo16h3OgRG0NBN9B
	stXSMHKRrFOFTGOibmcqhgAmVg==
X-Google-Smtp-Source: AMsMyM5Ikdyrjn122wjDfDlq98s0PHtxcQ+dQSAfOqdvIpDiAuCaq5FazvCR4dZ8DxlE/stA3URRag==
X-Received: by 2002:ac8:57ca:0:b0:35b:b51f:94fc with SMTP id w10-20020ac857ca000000b0035bb51f94fcmr4460736qta.276.1663878574201;
        Thu, 22 Sep 2022 13:29:34 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id c6-20020a05620a268600b006cbb8ca04f8sm4952352qkp.40.2022.09.22.13.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 13:29:33 -0700 (PDT)
Date: Thu, 22 Sep 2022 16:29:32 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH b4] Add dnf package on the Installing section
Message-ID: <20220922202932.fqrkcuhkp6u3bzwd@nitro.local>
References: <20220814215624.89760-1-mairacanal@riseup.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220814215624.89760-1-mairacanal@riseup.net>

On Sun, Aug 14, 2022 at 06:56:24PM -0300, Maíra Canal wrote:
> b4 is provided by Fedora Linux repositories through the package
> python3-b4 [1]. That said, add dnf package installation method
> on the README for Fedora-based systems.

Hello:

DNF and other installation options are now mentioned on the docs site:
https://b4.docs.kernel.org/.

-K
