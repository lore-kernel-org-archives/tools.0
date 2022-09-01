Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AC47480
	for <tools@linux.kernel.org>; Thu,  1 Sep 2022 21:40:49 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id b9so407526qka.2
        for <tools@linux.kernel.org>; Thu, 01 Sep 2022 14:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=cQJqRAz3OqP1uCe/xgpzkzJmIpmG4t/J+tAnO41gsMI=;
        b=fGFev1urSEYkVclMbzwtUN9FjfF5XvWjtT/H78OEuBBxnvYILEYCHBX4AYBvYPfpkw
         wQ0uB/KmKavVwY7OdRAwR9o2Pe9azcJrYdagEHSQJJ854GxAJJm8cjoQ4JXJ572T1lFm
         fPKwj+boYXINJiU9a5ehpF1fAVfgyMYXrRl2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=cQJqRAz3OqP1uCe/xgpzkzJmIpmG4t/J+tAnO41gsMI=;
        b=AkP/pz0+j3zyqrDfk3qjPaZHcVPP2F2OXA4jW/s4ZMlOkPorJ3Bs8GKQDUNrCdmcVC
         XhvjjH+s7PJykCONAHT0BlnteUPNg9djyM5ibBuNh3cMU+qaA0bFQBUh1VQMNZkWkQ19
         uPr2JLYBjrd0H5uCedJDwp1Aea34XY6Emem8ymzj1RHfkKzeNabuh72DhVXiCmWgNwym
         t4xt4rRwY0Jq3UJBx3LsIuk2TVoPPYowf823TEPpJL7s9Ame12lukIYjr4l+y2Aevvtr
         pxQ9j1O/aBW+UzvNT6ndMmlLxLwZeyNVGz1LyFgXupREWSKdHMFrOGkcF1RpihOIE2gq
         OJxA==
X-Gm-Message-State: ACgBeo0QuztfUzPjRfDMYfl/6tABZ81oE2R0S/aXHNNgWRiZU720ojrZ
	XESdux7Em9At38ojE5+t5TLVYtPmQGI92Q==
X-Google-Smtp-Source: AA6agR4FMQy2svzXkDxU7MgrESPAg4C0QWJRAQSr4+OJDrdkThgDqVZjA+U60MJtqUFXLUxAsr+1pQ==
X-Received: by 2002:a05:620a:c50:b0:6b9:6e6:428d with SMTP id u16-20020a05620a0c5000b006b906e6428dmr21063839qki.280.1662068448878;
        Thu, 01 Sep 2022 14:40:48 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id i11-20020a05620a248b00b006bb29d932e1sm44807qkn.105.2022.09.01.14.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 14:40:48 -0700 (PDT)
Date: Thu, 1 Sep 2022 17:40:47 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Please return trailer-order option
Message-ID: <20220901214047.oyrmg4hyyihkdbbg@meerkat.local>
References: <YtZZE/6BOR5m86Kq@unreal>
 <7bb8b97f-dc03-41af-866e-767e4c15df62@www.fastmail.com>
 <20220728171351.4v65ytd2s5wp2lb7@meerkat.local>
 <20c1ca09-58e8-4ed4-a586-871a2daad70f@www.fastmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20c1ca09-58e8-4ed4-a586-871a2daad70f@www.fastmail.com>

On Thu, Jul 28, 2022 at 09:42:10PM +0300, Leon Romanovsky wrote:
> >> Do you think that it is acceptable to return that option?
> >
> > Yes, it will probably come back as "trailer-priority" and preserve the
> > chain-of-custody ordering as discussed on the list. It should make it back in
> > by 0.10 release.
> 
> Sounds awesome.

FYI, this option is back as of today. It's still called "trailer-order", so
you shouldn't need to change anything. There are some important changes in how
it works:

1. we only reorder trailers that are in your own chain-of-custody section
   (below the last Signed-off-by that isn't yours)
2. we always move your own Signed-off-by to the bottom of your own
   chain-of-custody section

Please let me know if this new behaviour is working as you would expect it.

-K
