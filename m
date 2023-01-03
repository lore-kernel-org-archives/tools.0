Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FBE8F7C
	for <tools@linux.kernel.org>; Tue,  3 Jan 2023 22:40:35 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id jr11so25760317qtb.7
        for <tools@linux.kernel.org>; Tue, 03 Jan 2023 14:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xpNmtXYXGxXEOZPCKiSxcvOSVTOZjraS+R//ACNtbpY=;
        b=YRU21NFs5k+6RSWJCGV056pS6Bx1R/hE0Vqxoi/hTgEIORm6Sj6ZjDZHgmPSWH1q35
         NtDnLENw7I97beugPTNKu3mjejxvFq6MEoeXhLNk9CIbRk8djShR/VFK7pS9FvwqjyB7
         PfXLyU9zP0hJCBsn+S1OXC70Vz5q2h2xbEXmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpNmtXYXGxXEOZPCKiSxcvOSVTOZjraS+R//ACNtbpY=;
        b=2kWKTdGVsgbgpekRlW+pD/4PTY6mGXCMWQu6ULGjbwn0Qb2InJvmw/3h0iNax+DCI1
         8siqc6/Cr6ETcsrsy/XKmlLHObcgV+kJxWAx6dOTW8/nDgfKMDzEFoAtEZpoWuGx9kvA
         nIAbB+llQ3tgDA+oalPf6u3kMk9GqiECcJXw/BCG+TBtpwAfJQgl+q6Fb4SRLwzj1cRJ
         Kf3lOadF4B5t5PqtuKKYCfB7dluA1oHTf5K5dbdvhrp71decnRBoCU/2hSPZoN1mYGqo
         KnM4RCIq8M7aa18Ui5W1oLeAC3lkS0fw3ZyCkgln5cBcakMz0ZKPuFonmGw4HcCU4AIQ
         p9ow==
X-Gm-Message-State: AFqh2kpoEBoiLBvXfWKyeTL+PuGpXXVUZytUegl1UNsIhbicXE0FFKeb
	tzTjgV9qd0AszL1C2NBywomRrA==
X-Google-Smtp-Source: AMrXdXs+WMcJ7Hm+soIof9PEfWS0Ij9otBwnFmwp/AVm4TzyXzu1yyqQ9tUy1CbqabuqzALC8T8ApA==
X-Received: by 2002:ac8:5e8f:0:b0:3a8:175a:fd48 with SMTP id r15-20020ac85e8f000000b003a8175afd48mr60539532qtx.64.1672785634845;
        Tue, 03 Jan 2023 14:40:34 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id e7-20020ac84907000000b003a580cd979asm19473879qtq.58.2023.01.03.14.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 14:40:34 -0800 (PST)
Date: Tue, 3 Jan 2023 17:40:32 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: Inquiry around 'b4 send' individual patch Cc's
Message-ID: <20230103224032.dpy26yvpebbxndyq@meerkat.local>
References: <Y6zeRaKlqNhh72OD@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6zeRaKlqNhh72OD@dev-arch.thelio-3990X>

On Wed, Dec 28, 2022 at 05:24:37PM -0700, Nathan Chancellor wrote:
> Hi Konstantin,
> This appears to work for me but I noticed that if there are multiple
> patches that need to be Cc'd to the same people in the series, they are
> not deduplicated for the cover letter. For example, I see the following
> output with 'b4 prep -d' for this series, which has two MIPS patches,
> three PowerPC patches, and three s390 patches, which all include the
> exact same trailers generated from scripts/get_maintainer.pl:
> 
>     | To: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
>     | Cc: Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org,
>     |  llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>,
>     |  Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
>     |  Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arvind Sankar <nivedita@alum.mit.edu>,
>     |  Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
>     |  Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
>     |  Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
>     |  Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
>     |  Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
>     |  Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
>     |  Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
>     |  Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
>     |  Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
>     |  Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
>     |  Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
>     |  Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
>     |  Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
>     |  linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
>     |  Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
>     |  Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,
>     |  Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
>     |  Alex Deucher <alexander.deucher@amd.com>, Christian König <christian.koenig@amd.com>,
>     |  "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
> 

Eeek. This should be fixed now with the latest commit in master and
stable-0.11.y. Thank you for the report!

I should have a 0.11.2 out in the next day or two.

-K
