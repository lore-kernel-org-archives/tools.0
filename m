Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177FE399
	for <tools@linux.kernel.org>; Thu, 29 Dec 2022 00:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94959C433D2;
	Thu, 29 Dec 2022 00:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672273479;
	bh=NmVwMOFRb80O/plmGvptUVT4BetNYg/lUyX46hCv28s=;
	h=Date:From:To:Cc:Subject:From;
	b=gb06ejbz54Usov1wJYaKn1dSF8VB6UWpKaKtPfu1lzwyEU5TPt9mmyiO94AFpO3jp
	 sByW94Jc8yrGOT/f3Xmo0vrrEs3UsznyMyxbHOlJeXJceJsu4vTWJU715DSkLrc5Gx
	 FgJU78VUAOlCmQ6b+OqEfg+yuWTxah9J7KKWy50PlPpRspVbBxsS0I++fcKMEHnwma
	 F8Nm6u2qWje1lS5YErnVT6YcUBcNEtTdperTuwq/MbBHuM8c67Ekv9yAODAhnBj6T4
	 cEJzyhD1OLB7KfckCD6jY5gLocSHMI8D3dznI2gR8PUncj80WKdQbsmhg8Yl505ayX
	 KVFCP29rv6dqQ==
Date: Wed, 28 Dec 2022 17:24:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Inquiry around 'b4 send' individual patch Cc's
Message-ID: <Y6zeRaKlqNhh72OD@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Konstantin,

I have started using 'b4 prep' for a larger series I am getting ready to
send, thank you for such a great tool, as it makes wrangling and sending
larger series a lot simplier, especially having the cover letter as a
part of the history.

I have traditionally used '--to' and '--cc' flags to 'git send-email' to
send series to people who need to see the whole thing in combination
with Cc trailers in the cover letter and patches for people who only
need to acknowledge certain patches but need the full context of the
series.

Based on your announcement here [1], it appears that in b4, I would just
need to add trailers to the cover letter for people who should get the
whole series and trailers in individual patches for people who should
get just those patches and the cover letter.

This appears to work for me but I noticed that if there are multiple
patches that need to be Cc'd to the same people in the series, they are
not deduplicated for the cover letter. For example, I see the following
output with 'b4 prep -d' for this series, which has two MIPS patches,
three PowerPC patches, and three s390 patches, which all include the
exact same trailers generated from scripts/get_maintainer.pl:

    | To: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
    | Cc: Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org,
    |  llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>,
    |  Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
    |  Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arvind Sankar <nivedita@alum.mit.edu>,
    |  Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
    |  Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
    |  Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
    |  Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
    |  Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
    |  Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
    |  Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
    |  Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org,
    |  Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
    |  Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
    |  Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
    |  Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
    |  Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
    |  linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
    |  Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
    |  Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,
    |  Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
    |  Alex Deucher <alexander.deucher@amd.com>, Christian König <christian.koenig@amd.com>,
    |  "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org

Do note, I include in the commit message something like:

    Signed-off-by: Nathan Chancellor <nathan@kernel.org>
    ---
    Cc: ...
    Cc: ...

so that they are not added to the patch contents when they are applied.

Additionally, when I reflect this series back to myself, I noticed that
something appears to get messed up with the linuxppc-dev CC, as it gets
combined with Michael's name; I see the following in mutt for the same
series:

    To: Masahiro Yamada <masahiroy@kernel.org>,
            Nick Desaulniers <ndesaulniers@google.com>
    Cc: Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
            linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
            Nathan Chancellor <nathan@kernel.org>,
            kernel test robot <lkp@intel.com>,
            Thomas Gleixner <tglx@linutronix.de>,
            Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
            Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
            Arvind Sankar <nivedita@alum.mit.edu>,
            Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
            linux-mips@vger.kernel.org,
            Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
            linux-mips@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
            Nicholas Piggin <npiggin@gmail.com>,
            Christophe Leroy <christophe.leroy@csgroup.eu>,
            "linuxppc-dev@lists.ozlabs.org , Michael Ellerman" <mpe@ellerman.id.au>,
            Nicholas Piggin <npiggin@gmail.com>,
            Christophe Leroy <christophe.leroy@csgroup.eu>,
            "linuxppc-dev@lists.ozlabs.org , Michael Ellerman" <mpe@ellerman.id.au>,
            Nicholas Piggin <npiggin@gmail.com>,
            Christophe Leroy <christophe.leroy@csgroup.eu>,
            "linuxppc-dev@lists.ozlabs.org , Heiko Carstens" <hca@linux.ibm.com>,
            Vasily Gorbik <gor@linux.ibm.com>,
            Alexander Gordeev <agordeev@linux.ibm.com>,
            ", Christian Borntraeger" <borntraeger@linux.ibm.com>,
            Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
            Heiko Carstens <hca@linux.ibm.com>,
            Vasily Gorbik <gor@linux.ibm.com>,
            Alexander Gordeev <agordeev@linux.ibm.com>,
            Christian Borntraeger <borntraeger@linux.ibm.com>,
            Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
            Heiko Carstens <hca@linux.ibm.com>,
            Vasily Gorbik <gor@linux.ibm.com>,
            Alexander Gordeev <agordeev@linux.ibm.com>,
            Christian Borntraeger <borntraeger@linux.ibm.com>,
            Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
            Harry Wentland <harry.wentland@amd.com>,
            Leo Li <sunpeng.li@amd.com>,
            Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
            Alex Deucher <alexander.deucher@amd.com>,
            Christian König <christian.koenig@amd.com>,
            "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
            dri-devel@lists.freedesktop.org

If I am doing something wrong, please feel free to let me know! If there
is anything I can provide or test if this is a real problem, I am more
than happy to do so.

[1]: https://lore.kernel.org/20221202155644.kbnqvune7mo4khue@meerkat.local/

Cheers,
Nathan
