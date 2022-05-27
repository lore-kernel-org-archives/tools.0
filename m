Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B373C185D
	for <tools@linux.kernel.org>; Fri, 27 May 2022 14:15:27 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id v5so4086494qvs.10
        for <tools@linux.kernel.org>; Fri, 27 May 2022 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+kwZ4bEJqfMdeniCFH0OuuokEZf4hCavLWExxrN1c/g=;
        b=HQtTZK8qTdwoLOVHaWVie+p6LjkmPn0wIqdpYyz6vxS/8rc4t+qbPRloGkDfXlJ5dL
         Q7DzSR67AnvP0rb1hYFakFBFKoGCAj76m+KLo8wcOKX20e3HO+Fxs/pqIbPQx6q/h75F
         1s5MjGhvqQhJJBfOaO3+gZPSvZJOZdMm0JqI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+kwZ4bEJqfMdeniCFH0OuuokEZf4hCavLWExxrN1c/g=;
        b=Ksec2fWN5i0HDeYjM3iwsGawltK69KxJi3MXj27uUUhZKQJW93NylCA3tHUZ/1h+fn
         gpSnu/kYdVoFYhsNYtS49115W2MMldpQ6Z/6oeqqbNKcINSGL6rKmzqdxF1+T8bdRECx
         O4ju1WYtXDFkjuwLPxvdcGV6R7Df2XO9DLZEdXJ3gvxYSvJLVw/T7OKa0eLNInFR+02d
         CyUL/RRJynxV7B1YFGHCIuLfmPARYbPa2dh3iC/URb8ugFc1Qfgob+1cMZG5HMyNJ8to
         3jZ72OSmv7jk9tUMO5tKscOooAeMjZeiVoNWFf6TzVVLYzxvBVN0epGShhQePdh57SBJ
         jfBQ==
X-Gm-Message-State: AOAM53128WnzYde/WgB2NUggdRI/wqcvxQl0AOpsF1L1JrvpFbiZ31k/
	1JjBi0ERIMnL+0IsXazhrb699g==
X-Google-Smtp-Source: ABdhPJwk1O8op4yMVvA/g2DTeJTon2+brN2yDL3cVmyOJVIBmvYLDPXxp5lZpKO7vcxjp1zKaqRD8Q==
X-Received: by 2002:ad4:5bea:0:b0:45b:1f7:eee7 with SMTP id k10-20020ad45bea000000b0045b01f7eee7mr35653334qvc.11.1653660926625;
        Fri, 27 May 2022 07:15:26 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id r13-20020a05620a298d00b006a5edace97csm398146qkp.85.2022.05.27.07.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 07:15:26 -0700 (PDT)
Date: Fri, 27 May 2022 10:15:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: tools@linux.kernel.org
Subject: Re: b4 and lore are mangling from lines in patches
Message-ID: <20220527141524.awu2qhsduqx5kfyf@meerkat.local>
References: <20220527140950.GE2960187@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220527140950.GE2960187@ziepe.ca>

On Fri, May 27, 2022 at 11:09:50AM -0300, Jason Gunthorpe wrote:
> Hi Konstantin,
> 
> I noticed this:
> 
> $ b4.sh am https://lore.kernel.org/linux-iommu/20220527070307.2359150-1-liuke94@huawei.com
> $ grep ^From 20220527_iommu_drivers_iommu_directly_use_ida_alloc_free.mbx
> From git@z Thu Jan  1 00:00:00 1970
> From: keliu via iommu <iommu@lists.linux-foundation.org>
>            ^^^^^^^^^^^^
> 
> And when this is git AM'd the from line is mangled.
> 
> I see this is leaking into the main repo now:
> 
> commit 9ed1d7f510336e283c0bb2d20fd771e9d8fa085b
> Author: Vasant Hegde via iommu <iommu@lists.linux-foundation.org>
> Date:   Mon Mar 14 12:32:26 2022 +0530
> 
>     iommu/amd: Remove redundant check
>     
>     smatch static checker warning:
>       drivers/iommu/amd/init.c:1989 amd_iommu_init_pci()
>       warn: duplicate check 'ret' (previous on line 1978)
> 
> Can something be done?

This is done by the iommu list, not by lore or b4 -- someone turned on "send
emails from the list address," which is a terrible setting for lists that
receive patches.

You will need to complain to that list's admins, found at the bottom of
https://lists.linuxfoundation.org/mailman/listinfo/iommu

-K
