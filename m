Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC8D185D
	for <tools@linux.kernel.org>; Fri, 27 May 2022 14:20:03 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id x7so5417923qta.6
        for <tools@linux.kernel.org>; Fri, 27 May 2022 07:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MFXvArSb0uwTBghKsSkn0J6I0GabYezvqrTAT68RBzY=;
        b=THGMcV2aLY5ewoDYJbIeGSDn2M0lqsDMBJUuFstlefLwmPLXxqGaQjISdxoZAdiXif
         Z9MsV2fMI3t0cP9iEOF6hMTjKELg1uzP7zh0ujeywxyAWm/iYb0zGnojXH3rcPi2F2uk
         /tkYYOlDwkJVl35jZ5sEYvYl+sRZDl1alb59RTe1KE3iUukDSzpfracQIxFPGXJ1bCgl
         spF2WQDXdubikDhd4rdjNyWRA866RnK5L6PgC/h2zAjgr0tsDGJDNWAJx5KcloLS4Bqc
         Hyo3tNDZJrFuPH4QPBtKhzT/MCe4j8oae+1O1/xvJJqXTD9VH0q23NIFevpuefuXmYQR
         /EeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MFXvArSb0uwTBghKsSkn0J6I0GabYezvqrTAT68RBzY=;
        b=IkRaLdVhcyCDIP7tNVp/gp3Z+ASEnCISTu2aO6Eey6Q1ltymRPJYB58u7OAvdz1Tb5
         diDWaTai4ejBAXE2Y96OtYFsLAvaNznWmnbcmRfz2xofI5sADJ3NJAH5rgqVR1ZZ0IxP
         OnsupfmYSbMZZKGlYx7AN0X8QfdYjkAduAEDrp2jeSQpHY2LYUtOmWYlnidNy2IyhVRR
         TNP2ONC6o5LkkK//MBeqQREzX06VFRhQr3ToCzZdUCwG/YRGdEpjxZAPWUP6MGs0UlZh
         AvQEO8LvuhEe2d0CHcLRqnG4HtPkXXzThP61Rt6Fe9kLEcJWbhEzcX/9oVjCpq7qJTse
         PuFA==
X-Gm-Message-State: AOAM533x+HuqK1WLXM4IVtyes6HFhUYvBg6pZdNDUeC9F/LKlL4zvsxM
	rBeuGuLQ/8JbLIlWYSONA9hB63FXmUDiDQ==
X-Google-Smtp-Source: ABdhPJz+hQ8rj3D7qaEq7QhHyprcWZJ1YtYfXH1WPFfyqzgcK1AGyuroT1iypidhLZGXBJHtJlfh2g==
X-Received: by 2002:ac8:4e81:0:b0:2f9:34e4:8955 with SMTP id 1-20020ac84e81000000b002f934e48955mr20832455qtp.459.1653661202479;
        Fri, 27 May 2022 07:20:02 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id f22-20020ac84996000000b002f94737333bsm2569966qtq.21.2022.05.27.07.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 07:20:01 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1nuaor-00DXyh-71; Fri, 27 May 2022 11:20:01 -0300
Date: Fri, 27 May 2022 11:20:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	alex.williamson@redhat.com, joro@8bytes.org
Cc: tools@linux.kernel.org
Subject: Re: b4 and lore are mangling from lines in patches
Message-ID: <20220527142001.GF2960187@ziepe.ca>
References: <20220527140950.GE2960187@ziepe.ca>
 <20220527141524.awu2qhsduqx5kfyf@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220527141524.awu2qhsduqx5kfyf@meerkat.local>

On Fri, May 27, 2022 at 10:15:24AM -0400, Konstantin Ryabitsev wrote:
> On Fri, May 27, 2022 at 11:09:50AM -0300, Jason Gunthorpe wrote:
> > Hi Konstantin,
> > 
> > I noticed this:
> > 
> > $ b4.sh am https://lore.kernel.org/linux-iommu/20220527070307.2359150-1-liuke94@huawei.com
> > $ grep ^From 20220527_iommu_drivers_iommu_directly_use_ida_alloc_free.mbx
> > From git@z Thu Jan  1 00:00:00 1970
> > From: keliu via iommu <iommu@lists.linux-foundation.org>
> >            ^^^^^^^^^^^^
> > 
> > And when this is git AM'd the from line is mangled.
> > 
> > I see this is leaking into the main repo now:
> > 
> > commit 9ed1d7f510336e283c0bb2d20fd771e9d8fa085b
> > Author: Vasant Hegde via iommu <iommu@lists.linux-foundation.org>
> > Date:   Mon Mar 14 12:32:26 2022 +0530
> > 
> >     iommu/amd: Remove redundant check
> >     
> >     smatch static checker warning:
> >       drivers/iommu/amd/init.c:1989 amd_iommu_init_pci()
> >       warn: duplicate check 'ret' (previous on line 1978)
> > 
> > Can something be done?
> 
> This is done by the iommu list, not by lore or b4 -- someone turned on "send
> emails from the list address," which is a terrible setting for lists that
> receive patches.
> 
> You will need to complain to that list's admins, found at the bottom of
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

Ah given the linuxfoundation.org I had guessed that is you. Let's add
Alex and Joerg.

Jason
