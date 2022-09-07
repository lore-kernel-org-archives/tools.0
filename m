Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1655C91
	for <tools@linux.kernel.org>; Wed,  7 Sep 2022 13:50:11 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id e28so10424378qts.1
        for <tools@linux.kernel.org>; Wed, 07 Sep 2022 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=AV2pO32b9Tvu8turHh+bjFLHymu03QUDqK5Im2eSx5g=;
        b=RlJkKHThQy5okQg7UPw3EcGv3ilxhOOuoqkb1oOHxlzxkKJIUk+3lOWjmAzLJndHCg
         DaBCOipcCcSxgMB8+oENGs0uiizI57I59obSjKrXrzQi/JDn3Tt85nDY/Mjq3YRUIdKf
         fC9iPccDyv77RNU6OiQ7ri0VgFoBMomIjdh8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=AV2pO32b9Tvu8turHh+bjFLHymu03QUDqK5Im2eSx5g=;
        b=khHxeZXadN3Zd2Hs5JfygMTxontPVn1GnEQAnhJ/xZPOSho+e5bkvmNxnzc/ARf/4f
         PtzWnpZo30JeZxdSvCR2AL2Bo62vVXnGJvpttNbHnm4nrmEbszbycUo6bEXkmn48prNf
         VKe7Z3ryH7h3eyUyw/IDU1LHF3Pa/SMN1Qw6qb6W4GwBt/445jGeaQPT5B/i9PWAFnAM
         DzycArKKD8S2os2R0qRBHPrtQLDPJ9gBIjCWLVZRshVwN8Hj0nyS5OFabPiQEFeTFfGl
         Kht12kTEylbl8g28YMh/xqRpPewVw27IQntqn2f2BhrBgm/bu8PJ2u2nJE+G955dRFIi
         Pyhg==
X-Gm-Message-State: ACgBeo3ur2XZOYnapxK5CC1ABRH5hXqHRc/qvKfcisIDXm337UeavWSP
	EWpkpM/YI8u8shg3UUyWmmZNwg==
X-Google-Smtp-Source: AA6agR4Q/pKU9YfmkDIDnyImzCCojdoCTQ4MIWwkkH/imFDZRXzM0WGTyPt6IfBR0qW121VzH4hXGQ==
X-Received: by 2002:a05:622a:e:b0:344:9c6a:3616 with SMTP id x14-20020a05622a000e00b003449c6a3616mr3337122qtw.362.1662558610801;
        Wed, 07 Sep 2022 06:50:10 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id a9-20020ac844a9000000b0034305a91aaesm11739035qto.83.2022.09.07.06.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 06:50:10 -0700 (PDT)
Date: Wed, 7 Sep 2022 09:50:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 prep/b4 send feature request
Message-ID: <20220907135008.hu5h4tlzwrnffyph@meerkat.local>
References: <Yxecq5DHE5oW0XJD@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yxecq5DHE5oW0XJD@google.com>

On Tue, Sep 06, 2022 at 12:16:59PM -0700, Dmitry Torokhov wrote:
> Hi Konstantin,
> 
> Not sure if you are taking feature requests, but it would be great if
> the magic that happens after sending patches via "b4 send" could happen
> on demand.
> 
> The reason is I am using OAuth2 when authenticating to Gmail to
> send/receive mail, and b4 does not support it, so I tried using "b4 send
> -o ..." followed by "git send-email ..." (and I was able to set up git
> send-email to work with OAuth2 tokens), but in this case the magic does
> not happen.

This feature is now in master as:

    b4 prep --manual-reroll COVER_MSGID

It requires that you look up the message-id of the cover letter so we can
retrieve the body and use it in the tag (for RESEND purposes).

-K
