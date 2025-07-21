Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104331552E0
	for <tools@linux.kernel.org>; Mon, 21 Jul 2025 00:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753059308; cv=none; b=S0RBOIEFhSLL+SCxpkjKGS0v7TM2ePUjrD69YFG2lef6T8vJxq/Xx+7WwLXs7dndkqVGzp13DeoC8XB6aY7NbK5ACfVYhFQ/bxbP1Mv5IKEDC+952HTI9uBtixZjnjHDzc0Z7cKmMizx3IPBzaWdBxuaDZ0Ah+iEMrttVmrGqgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753059308; c=relaxed/simple;
	bh=sM9yBsMCLLRYDK7HcYMiFENLAMw/Qrsw0/qfDYalqnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPDlVt21+8o1GvmyGBr02WS7BrSWQBgM3UNc+uhUl8FH4FZ7h4o/Namoyf8P7gGENlObkotwFsmuD9NSBSxFZU1EXRC2I0eSsTBVF4oxrV+PXhhBnuQHkL2jGJNbdt2vStnCbbZTCt1K24LTTZk7KgJEM+dbcir7AYGe1YUBIp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WmAYMWJ2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WmAYMWJ2"
Received: by smtp.kernel.org (Postfix)
	id A303FC4CEF6; Mon, 21 Jul 2025 00:55:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A9DAC4CEE7;
	Mon, 21 Jul 2025 00:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A9DAC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=yL7XvIZ8aSR18txK0A+NfWoqxJXFpqXiT6eL6G1IbIY=; b=WmAYMWJ2Z4gaMirSioF2MktZHK
	wlRnKKud+MiqOBUX3tB10mQ/WR0olJQDS5DeHiN4LM/YDB/kgWiME0fFO6Vaiga97ccX1DDX/MJhK
	egbNGJ7d/qbGqlroD78VjGKtLR7LUWl0OB01Ef1Au4lAplNX6j1LG7oqTIoOrSv5GHC9saePK2Keh
	idEy6BlyoN+tWY9Tze56QTdyRx7M0h3GLCP3l/muMkl5fY9CMZQ2Ioq1jHKYo4CtpT5twsECXxrAJ
	ji33s/O7uw3qAhYZl3F+s2jcvGCaiSSKStuO/G8mPEDeBKCe6EjsOJECJd8nvqoRpO/sdFFFm8V6t
	6PNQttxw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udeo5-0000000FtkO-1rpu;
	Mon, 21 Jul 2025 00:55:05 +0000
Message-ID: <4777f4d7-f1c6-4345-92b2-0ba5d6563ee2@infradead.org>
Date: Sun, 20 Jul 2025 17:55:05 -0700
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 2/4] kernel/api: enable kerneldoc-based API
 specifications
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-api@vger.kernel.org, tools@kernel.org
References: <20250711114248.2288591-1-sashal@kernel.org>
 <20250711114248.2288591-3-sashal@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250711114248.2288591-3-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sasha,

I would like to ask a few questions to try to clarify/understand, please.

On 7/11/25 4:42 AM, Sasha Levin wrote:
> Allow kernel developers to write API specifications directly in
> kerneldoc comments, which are automatically converted to machine-readable
> C macros during build.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  kernel/api/Makefile              |  21 +-
>  scripts/Makefile.build           |  28 ++
>  scripts/generate_api_specs.sh    |  59 +++
>  scripts/kernel-doc.py            |   5 +
>  scripts/lib/kdoc/kdoc_apispec.py | 623 +++++++++++++++++++++++++++++++
>  scripts/lib/kdoc/kdoc_output.py  |   5 +-
>  scripts/lib/kdoc/kdoc_parser.py  |  54 ++-
>  7 files changed, 791 insertions(+), 4 deletions(-)
>  create mode 100755 scripts/generate_api_specs.sh
>  create mode 100644 scripts/lib/kdoc/kdoc_apispec.py
> 

[snip]

> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a6461ea411f7a..5c0e44d1b6dbc 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -172,6 +172,34 @@ ifneq ($(KBUILD_EXTRA_WARN),)
>          $<
>  endif
>  
> +# Generate API spec headers from kernel-doc comments
> +ifeq ($(CONFIG_KAPI_SPEC),y)
> +# Function to check if a file has API specifications
> +has-apispec = $(shell grep -qE '^\s*\*\s*(api-type|long-desc|context-flags|param-type|error-code|capability|signal|lock|side-effect|state-trans):' $(src)/$(1) 2>/dev/null && echo $(1))
> +
> +# Get base names without directory prefix
> +c-objs-base := $(notdir $(real-obj-y) $(real-obj-m))
> +# Filter to only .o files with corresponding .c source files
> +c-files := $(foreach o,$(c-objs-base),$(if $(wildcard $(src)/$(o:.o=.c)),$(o:.o=.c)))

1. One must build a kernel (with some desired .config file) to use/test this,
correct?

2. It looks like it only checks .c files, omitting header files. (?)
Some APIs are only present in header files (e.g., all of <linux/list.h> is
either macros or inline functions).


> +# Also check for any additional .c files that contain API specs but are included
> +extra-c-files := $(shell find $(src) -maxdepth 1 -name "*.c" -exec grep -l '^\s*\*\s*\(api-type\|long-desc\|context-flags\|param-type\|error-code\|capability\|signal\|lock\|side-effect\|state-trans\):' {} \; 2>/dev/null | xargs -r basename -a)

3a. included files: does this catch the (rare) use of a C file doing
#include <path to some other C file> ?

3b. Quite a few makefiles generate final .o files with a different name
from the source files. It looks like that is handled above by looking
for the first (or intermediate) .o file for each .c file, so the final
.o file with a different name is ignored (or at least doesn't come into
play here). Yes?


> +# Combine both lists and remove duplicates
> +all-c-files := $(sort $(c-files) $(extra-c-files))
> +# Only include files that actually have API specifications
> +apispec-files := $(foreach f,$(all-c-files),$(call has-apispec,$(f)))
> +# Generate apispec targets with proper directory prefix
> +apispec-y := $(addprefix $(obj)/,$(apispec-files:.c=.apispec.h))
> +always-y += $(apispec-y)
> +targets += $(apispec-y)
> +
> +quiet_cmd_apispec = APISPEC $@
> +      cmd_apispec = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -apispec \
> +                    $(KDOCFLAGS) $< > $@ 2>/dev/null || rm -f $@
> +
> +$(obj)/%.apispec.h: $(src)/%.c FORCE
> +	$(call if_changed,apispec)
> +endif
> +
>  # Compile C sources (.c)
>  # ---------------------------------------------------------------------------
>  

[snip]

Thanks.

-- 
~Randy

