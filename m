Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD683FCC
	for <tools@linux.kernel.org>; Fri,  1 Oct 2021 11:59:51 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id q125so8774391qkd.12
        for <tools@linux.kernel.org>; Fri, 01 Oct 2021 04:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pkJtp5YGLlhQXwphs4q89yTq7Pk0ylLvU2kldO/rSI8=;
        b=BjqRrJGVMEK27hxB6R7GzVflQfd2rCtZKGTCm8I0rms3N9TnKMTHL42NU3EN0wLnoC
         q4CxCMo4IHHFrI/ymrG26xu3OA34C7Tylwmrudv8jWvaNbCmJZLbS4kQtb089HgzK4Yz
         frRv9GKTIGn6FW+E912OpJIlQGscQBsOaY2u+EfZpvPNMZixjCyisefrtSv1KkuveHdt
         vWGDUMOD6RRPJLy8tJFyOWbe08lyi5KQ9IkIF0ifzGdm9w1fLxeEkyvFG5nb3S9jUT88
         jkBUHEvl50BGCTK3d4QSjnMcS7EhTux/40gP0o/Znq6MLJ/syUFwioDfWxoc4Kia+ekq
         D6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pkJtp5YGLlhQXwphs4q89yTq7Pk0ylLvU2kldO/rSI8=;
        b=bGM75pNgFf+2WJ9Gf2F8ruIq4YZ7AOeB8NKXayUL1ao9GA4j/ILeuq7heuwXxVl9c0
         3Zhhd6LNrqEMDHqP/POt14LQAHy0mGwA8En4C1JB3fP6MVhVHOtrnyQtmPNbTbowiR4c
         0EP6dKbCMIIm12bjsc1dq0MP7NnY5LjbsCQpwq6YITJk83pstfsPe0PxT/5isNY73C6i
         bPhWwvpjc5OezEt1zjnaFE96Sj7MdkXhTul0YGb4Tj9b390v3hTbGz6K+QSuZacb9qlb
         TkaKeHPUynGbRJmn1mRhfo3Z29SjqqO2A3tDAkBdLJsVG0hdbOZr+jYHBl9cQ1b1tabF
         a+AQ==
X-Gm-Message-State: AOAM532q/4FDzh0Df4gH2lz+C2RsahgGzrkx31xVlejg3VArrumRNsJ7
	dvk9QW1syWdb/vMkmxSxWuXhwQ==
X-Google-Smtp-Source: ABdhPJyKqBQGreWzd58y/roFvnBBbFkcKkWfjDgtltG+xZ3RtFtCUoZMb8fRi0Rg+5Y3fxcbmNK75Q==
X-Received: by 2002:a37:6c06:: with SMTP id h6mr88645qkc.201.1633089590198;
        Fri, 01 Oct 2021 04:59:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id g21sm3119555qtq.53.2021.10.01.04.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 04:59:49 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1mWHCe-008P3i-Sm; Fri, 01 Oct 2021 08:59:48 -0300
Date: Fri, 1 Oct 2021 08:59:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kees Cook <keescook@chromium.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <20211001115948.GK3544071@ziepe.ca>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <20211001092914.4738513b@canb.auug.org.au>
 <202109301630.C2646F8B5@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202109301630.C2646F8B5@keescook>

On Thu, Sep 30, 2021 at 04:42:58PM -0700, Kees Cook wrote:

> The only "hole" I see with the integrity checking is that since only tags
> or mbox headers are signed, and those aren't part of the merge, there
> isn't a easy way that I see to follow the integrity chain for a given
> resulting tree. (Which is technically different from the "trust" chain.)

The git tag and signature are part of the merge commit:

$ git show --show-signature v5.15-rc3-151-g78c56e53821a7e
commit 78c56e53821a7ec3462ce448c1fe6a8d44358831
merged tag 'for-linus'
gpg: Signature made Wed 29 Sep 2021 09:57:42 PM ADT
gpg:                using RSA key 7C1EC530B87EF10C4BFBA8B7386DF7157E209B1A
gpg: Good signature from "Jason Gunthorpe <jgg@nvidia.com>" [ultimate]
gpg:                 aka "Jason Gunthorpe <jgg@mellanox.com>" [ultimate]
gpg:                 aka "Jason Gunthorpe <jgg@ziepe.ca>" [ultimate]
gpg:                 aka "Jason Gunthorpe <jgunthorpe@obsidianresearch.com>" [ultimate]
gpg:                 aka "Jason Gunthorpe <jgunthorpe@gmail.com>" [ultimate]
gpg:                 aka "Jason Gunthorpe <jgg@kernel.org>" [ultimate]
Merge: 02d5e016800d08 e671f0ecfece14
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Sep 30 12:00:46 2021 -0700
[..]

You can see the raw data like this:

$ git cat-file commit v5.15-rc3-151-g78c56e53821a7e
tree cc120d95622f6363c42b7ee9a759aefb11c4f11a
parent 02d5e016800d082058b3d3b7c3ede136cdc6ddcb
parent e671f0ecfece14940a9bb81981098910ea278cf7
author Linus Torvalds <torvalds@linux-foundation.org> 1633028446 -0700
committer Linus Torvalds <torvalds@linux-foundation.org> 1633028446 -0700
mergetag object e671f0ecfece14940a9bb81981098910ea278cf7
 type commit
 tag for-linus
 tagger Jason Gunthorpe <jgg@nvidia.com> 1632963221 -0300
 
 RDMA v5.15 first rc pull request
 
 Several core bugs and a batch of driver bug fixes:
 
 - Fix compilation problems in qib and hfi1
 
 - Do not corrupt the joined multicast group state when using SEND_ONLY
 
 - Several CMA bugs, a reference leak for listening and two syzkaller
   crashers
 
 - Various bug fixes for irdma
 
 - Fix a Sleeping while atomic bug in usnic
 
 - Properly sanitize kernel pointers in dmesg
 
 - Two bugs in the 64b CQE support for hns
 -----BEGIN PGP SIGNATURE-----
 
 iQIzBAABCgAdFiEEfB7FMLh+8QxL+6i3OG33FX4gmxoFAmFVC4YACgkQOG33FX4g
 mxrBuw//XpgZqcXtAd/p70Qp0pgMULb44p6BNCh0HixyFnBFybsxvy3jsjAI5qkb
 +BszhjWRBdkWxwae/LgbIE30TlTu+mFqWhRgBcATa8HujgPiNFDPOxB/oaNpI4Qb
 SUASou2IcMfTBnxu0T1gZ3v6UVOHhD0RzZJsA86vweVmeReGUNITXzso8QmZtz5Y
 7j5x1mWYbmGY3fQx8sur7iKasMIN4i8fPg3ntj84kDOcNTeSg0ir/sVaAX8iSkHB
 LoF2iXZ6B/2OM0rU238qZVC1bzs3ZXFsfvpRqXs+gR48VH4kKnnWunYeDV5qKLAs
 V/YRvwZ/fdz/qZ8wLBnYjaEL7pOprvR/zHNx1Bj66/pvBADKcpVs+DlBZ4hfTh6T
 Qx//LooadcSU3YW3owSXJy2o2orYQlXuD21kdWx3+RTgOlZxDPcMrn6vQe9eEeaB
 tMt7ueUAch1Dz56ZuxYEPy3RbzHeTeWVQro0j7SEb9vImW8pOnURRSV9WuPn+IeJ
 8tMPbBD+vKv7QxnN161fn4i+WbhMiEUmyu4eEjrZgtXZ4Xq0B7QbhsPpPujpNw/I
 fPs6IHWmRKctMOwBpG337yWpbVQbMJcD8P18A9+rrUHdMvS4q2W/U8mJfApWhF9R
 PuE5W8wL/tWTrbqEcp6hzHWqMMVWd6iTcYU/iF6RwFstjrndHFU=
 =PE1D
 -----END PGP SIGNATURE-----

Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma

Pull rdma fixes from Jason Gunthorpe:
 "Not much too exciting here, although two syzkaller bugs that seem to
  have 9 lives may have finally been squashed.

  Several core bugs and a batch of driver bug fixes:

   - Fix compilation problems in qib and hfi1

   - Do not corrupt the joined multicast group state when using
     SEND_ONLY

   - Several CMA bugs, a reference leak for listening and two syzkaller
     crashers

   - Various bug fixes for irdma

   - Fix a Sleeping while atomic bug in usnic

   - Properly sanitize kernel pointers in dmesg

   - Two bugs in the 64b CQE support for hns"

* tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma:
  RDMA/hns: Add the check of the CQE size of the user space
  RDMA/hns: Fix the size setting error when copying CQE in clean_cq()
  RDMA/hfi1: Fix kernel pointer leak
  RDMA/usnic: Lock VF with mutex instead of spinlock
  RDMA/hns: Work around broken constant propagation in gcc 8
  RDMA/cma: Ensure rdma_addr_cancel() happens before issuing more requests
  RDMA/cma: Do not change route.addr.src_addr.ss_family
  RDMA/irdma: Report correct WC error when there are MW bind errors
  RDMA/irdma: Report correct WC error when transport retry counter is exceeded
  RDMA/irdma: Validate number of CQ entries on create CQ
  RDMA/irdma: Skip CQP ring during a reset
  MAINTAINERS: Update Broadcom RDMA maintainers
  RDMA/cma: Fix listener leak in rdma_cma_listen_on_all() failure
  IB/cma: Do not send IGMP leaves for sendonly Multicast groups
  IB/qib: Fix clang confusion of NULL pointer comparison

Jason
