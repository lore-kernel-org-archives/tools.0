Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5CE3E715C
	for <tools@linux.kernel.org>; Tue,  5 May 2026 07:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777967185; cv=none; b=iQ1YFWTxP9ZeDXO+0OQFhj4q5eEmJhW3+EYr3F8ArDr9KRO5JfiwM+A4B5iM5itzfmgjar+Tlvjc8xHZOZvj0M/FbdGlGdQ4Rpsy2HSWoZQopsYi6+0BB9QzfGwSFCJ7IGmVZc+u3TS4FjlNWBPpMoyVZf0OJi2Hfq8bhcLZ4kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777967185; c=relaxed/simple;
	bh=Dh359CCAET/Dcf0kc0xq9hC4/ZKbmHpQLlb9PuI5lg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=cuRsCk48zWrcnKKj+BZ++yyCSHgFfrJQDSfcv9EfATOf0JY4wQ6h2256OjMRcwy5fWvmkdIDnsSS5PGHRVJP7LtlxoDxYClNSLMxLgyDYdkfFOl3+SOZNTJ4VlR5picKvCYPWFrZB1dj+DPTYpUoxVWvTVv2AxpfmM0EDt21Wyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c10hnoyS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c10hnoyS"
Received: by smtp.kernel.org (Postfix)
	id 86564C2BCF7; Tue,  5 May 2026 07:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D808CC2BCF6;
	Tue,  5 May 2026 07:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777967183;
	bh=Dh359CCAET/Dcf0kc0xq9hC4/ZKbmHpQLlb9PuI5lg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c10hnoySGjXxg3K9jTCfXe36MtvXSuPY8p2hY0x8zqPFF2DVOKojeXKe2hPTmwnST
	 +PF7EocxGIO0LiCTow7sE20lTO4M9c/AVg2rNT5g60dk7Iu0iiZS8YFMwefjtCkBMl
	 xeCY16xt09o5C7RYRB+XUMALe4CVGoOVYuf5giGaXdclBkUwyGKylWvgy+iIGcRT6z
	 TEjHSureW/sH2SZFGQst8Ks9A/cpgqoxdqtIKtJqAyNjK6rUPlVbho9tFPpHkjQfFq
	 pW/vjdt7ZbcEjx59zOuRDkimUl8/Uzz+rACGzMulDw/luV+49RVvbySvK8WZv9Q+fU
	 zmHudV1sT79fw==
From: Sasha Levin <sashal@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	workflows@vger.kernel.org,
	tools@kernel.org,
	x86@kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Cyril Hrubis <chrubis@suse.cz>,
	Kees Cook <kees@kernel.org>,
	Jake Edge <jake@lwn.net>,
	David Laight <david.laight.linux@gmail.com>,
	Askar Safin <safinaskar@zohomail.com>,
	Gabriele Paoloni <gpaoloni@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 1/9] kernel/api: introduce kernel API specification framework
Date: Tue,  5 May 2026 03:45:42 -0400
Message-ID: <20260505074545.430334-3-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <afI1LMB_vNMWYU7o@levanger>
References: <20260424165130.2306833-1-sashal@kernel.org> <20260424165130.2306833-2-sashal@kernel.org> <afI1LMB_vNMWYU7o@levanger>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 29, 2026 at 06:43:24PM +0200, Nicolas Schier wrote:
> On Fri, Apr 24, 2026 at 12:51:21PM -0400, Sasha Levin wrote:
> > diff --git a/kernel/api/Makefile b/kernel/api/Makefile
> > new file mode 100644
> > index 0000000000000..c0a13fc590e4a
> > --- /dev/null
> > +++ b/kernel/api/Makefile
> > @@ -0,0 +1,14 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Makefile for the Kernel API Specification Framework
> > +#
> > +
> > +# Core API specification framework
> > +obj-$(CONFIG_KAPI_SPEC)		+= kernel_api_spec.o
>
> Bike-shedding: I'd use 'obj-y' here, to state clearly that
> kernel_api_spec.c is the core part in the kernel/api/ subdir.  If
> CONFIG_KAPI_SPEC is unset, the subfir will not be entered at all.

Agreed, switched to "obj-y" in v4. The subdir gate moves up to
kernel/Makefile and the entry inside kernel/api/Makefile becomes
unconditional. The other two entries (KAPI_SPEC_DEBUGFS,
KAPI_KUNIT_TEST) keep their own conditional guards since they are
optional sub-features.

--
Thanks,
Sasha
