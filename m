Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332FD3FC3
	for <tools@linux.kernel.org>; Wed, 25 Aug 2021 16:45:02 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id v1so288493qva.7
        for <tools@linux.kernel.org>; Wed, 25 Aug 2021 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GoLFMBV7t/9e+DZR0keC/Y9bZoe0ytKLEZY6XNeQ16Y=;
        b=S7o5vxb7kjmBiatSPftBTCEv+j0g3TDOYC0Ce0tmZ/fZvUHhcttQNlc4zzVK13Ohe6
         kqAcVU0lQo6BVe1uDH3Fmd5QdAOaRmmgdGcWCcJGUTuvJhP2eHgr46InDJOot2/WcjiD
         8FVssSMDbCbFTsjQPTh28b8vfznV9Gko3siuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GoLFMBV7t/9e+DZR0keC/Y9bZoe0ytKLEZY6XNeQ16Y=;
        b=QKJNzJrhh/vrGrgxvkAba4wnOdaAT5RLv1UGTVg3eAKa7G4zy3fcgQ/hqavQu/pIbn
         Z3mKCnx+52AIdL+Leqq4vJ94A2d6rJkYQUhy35rbaD5PEuBTczva65DwyijPNuqlCFap
         lYkjVhL6Nq7nNj6PHd2PzknpCVeQsbVFPN9diXIPpSvFm/OnwRsSJDtZhYYMhRL9uhNS
         b7/b5VbIzMa26/trbzeLdjMcpZslbJVm1XCgTA5boAtG4AzrL2IVIgZGERmU9DT2JiRH
         vpqeVdtPQ4vp2W94Y1z+1NZFALPhZvcZoJr5D9ZJ9OUI5t4Me0qje/AvVEno1hJXWQXc
         3cOw==
X-Gm-Message-State: AOAM531me1aE/eQXZSyH97LhAMEDzv/uQZoIcwaQz6NoKo0pkv5v9/wa
	v8TTsVmvEk/DsgbtpU8VOa999Q==
X-Google-Smtp-Source: ABdhPJypZCTIKsiOesyeUuTm+IK5pq0JsPCuaK5pcOUn/jSQQgojGGqnvkP55KITj+7USnedhmDI9A==
X-Received: by 2002:a05:6214:1142:: with SMTP id b2mr45854973qvt.0.1629909901101;
        Wed, 25 Aug 2021 09:45:01 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id a185sm353758qkg.128.2021.08.25.09.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 09:45:00 -0700 (PDT)
Date: Wed, 25 Aug 2021 12:44:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: New version of lore available for preview
Message-ID: <20210825164459.5pxaxsl5a6nuipbt@nitro.local>
References: <20210818190750.g3xedu7j24sqndo2@nitro.local>
 <CAL_Jsq+zxVw3BaAzF+58KT9jrFWNzUpELevj=SGPJSrdcVFPSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+zxVw3BaAzF+58KT9jrFWNzUpELevj=SGPJSrdcVFPSw@mail.gmail.com>

On Wed, Aug 25, 2021 at 11:30:37AM -0500, Rob Herring wrote:
> > You can use x-lore with b4, though I strongly recommend switching to master
> > branch in order to better deal with some of the changes happening on the
> > server-side. Simply add the following to your ~/.gitconfig:
> >
> > [b4]
> >   midmask = https://x-lore.kernel.org/r/%s
> >
> > Please report any problems or hiccups that you discover. There is no specific
> > ETA for the new version go-live, but if all goes well, the hope is to have it
> > in place by end of August.
> 
> I've switched over and so far, so good. I'm happy that now I get full
> threads regardless of the sender's choice of MLs and no more mangling
> of subjects with commas in them (DT patches frequently have commas).

Great to hear, thank you for sharing that. I've been running b4 in a loop
against /all/ as well, and so far so good on my end, too. The plan is to
switch over to the new lore on Monday, August 30, but I need to release b4 0.8
first, which is needed to better work with the upstream public-inbox changes.

Best regards,
-K
