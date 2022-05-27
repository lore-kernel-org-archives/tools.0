Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641F810F2
	for <tools@linux.kernel.org>; Fri, 27 May 2022 14:30:19 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id f35so5385536qtb.11
        for <tools@linux.kernel.org>; Fri, 27 May 2022 07:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3zu3q0kbWlNXU9843v0B8p+mRE2TB1pPhXqVhIPKnbo=;
        b=BXcLmnMgXhiRitlKbsw6QA2RATncyNpfqum94JYavEHZCovYcSFyPQAoFyHFMXlq8z
         gCF6FcyKoq0XMOjIC96EnDjeqQW4MzrGRuWcbZBaVE5rxD7rq8EZmN8JPDGmYfossmyo
         DE1zwZqa8GizcgbwVUqF2Vh2A49R8SEjA+Aqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3zu3q0kbWlNXU9843v0B8p+mRE2TB1pPhXqVhIPKnbo=;
        b=gzYCXIruhEDdTjIXQqm9YAWUQVd5a+i4WJGw7uxBEjhqFTNOzuwJ2p/JUGMay9Ydbf
         CQH37mFoOKTDLNnodx0nunoNEBMRTYCqv/ZGW+Y1KYDZLQoFjulVNpBoZpmu+y7TmAqp
         EuybXVrn5Lxlx0wnwnW8Ze0Y9n/adk0ewgtHYeVCsgjVye6g76Ua6lC8TE4/mOk6xaoe
         rWIAn/KDiGI/Qjf3Awky3XXCflKTDlTIf0eI2Z4mjEcVl6FZ93H7p9tFUcBlWjEbxb0W
         x8gi65DHmTL8OSejyPYtiPo1XI8UgmEoEn+74Ho0KT9QCrV5aGPaZgOnT4Llci1aXw1X
         XlJg==
X-Gm-Message-State: AOAM533ZZDF6dzBejJrEwnBQ4k1dvPOZQ1YRv55WMIli8+SameFYn8cI
	w2benIy91vKTMsj80xIxyJuqmQ==
X-Google-Smtp-Source: ABdhPJziMSMgICNPmq3SrLDXxaBb0rgOXO3KoFwwhluwCFGWQPAURiYyRlwSJlJlr1NDu9NusMw7Qg==
X-Received: by 2002:a05:622a:1998:b0:2f9:4415:49e6 with SMTP id u24-20020a05622a199800b002f9441549e6mr14664694qtc.423.1653661818240;
        Fri, 27 May 2022 07:30:18 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id l18-20020a05622a051200b002f939be4868sm2648498qtx.19.2022.05.27.07.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 07:30:18 -0700 (PDT)
Date: Fri, 27 May 2022 10:30:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: alex.williamson@redhat.com, joro@8bytes.org, tools@linux.kernel.org
Subject: Re: b4 and lore are mangling from lines in patches
Message-ID: <20220527143016.hygvggkmvszgh4xe@meerkat.local>
References: <20220527140950.GE2960187@ziepe.ca>
 <20220527141524.awu2qhsduqx5kfyf@meerkat.local>
 <20220527142001.GF2960187@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220527142001.GF2960187@ziepe.ca>

On Fri, May 27, 2022 at 11:20:01AM -0300, Jason Gunthorpe wrote:
> > This is done by the iommu list, not by lore or b4 -- someone turned on "send
> > emails from the list address," which is a terrible setting for lists that
> > receive patches.
> > 
> > You will need to complain to that list's admins, found at the bottom of
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
> Ah given the linuxfoundation.org I had guessed that is you. Let's add
> Alex and Joerg.

It's certainly not a strange guess, but in this case lists.linuxfoundation.org
management is outsourced to OSUOSL. :)

I generally recommend moving from that host to lists.linux.dev, as list.lf.o
will probably forever remain on mailman2 and never become DKIM-compliant.

-K
