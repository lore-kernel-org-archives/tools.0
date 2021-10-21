Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DD62C80
	for <tools@linux.kernel.org>; Thu, 21 Oct 2021 20:22:32 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id c4so1300687pgv.11
        for <tools@linux.kernel.org>; Thu, 21 Oct 2021 13:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=x4iMrftVcXN8WudecmytNqOVX1VdpyxgWIcqkgZX1OA=;
        b=INeTwnMAPSIg9CYGSmPCL08tjbainU94smIgo+Mw+uPDwwQjGNY3GDaDXwogas1zG9
         OPsmzCl7viwuBNgBh9zna/gQehxh+WRTZh+V/VytYTPEikckKIpU5SnfDDUfn4iRAaWF
         qXtwwLLjoaGIZraqELRozNHX481TYVZzDnf1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=x4iMrftVcXN8WudecmytNqOVX1VdpyxgWIcqkgZX1OA=;
        b=l3XLW1Gsd99Ai9n60wWV6h5DGe7D0NxNeXRS2YwTM6iQXL+oNCF4anyzQDI06vkLzW
         5WgdIPEVgZDNpxdT5B0cr9bQGFA/5NReBnkgRetEAHahnoNoYxZBVmYOVKnMPuIQzqu0
         SFeAjHA2nqYnJvoG9sRpRooCFFrXJasjxYJW1xT2Eub6r66LzdPZL7oFIPyr7xEwdfRj
         Oa6BPjlAs/PP3S0E4VGOwj3vvasRDHyUw40WN+lILnkDs+GG58KLJPooR+8YmP/pa2Ip
         vJczDkzuV1eFN0CfZHKxalaqTt+Se66joGr6zm83JZVSlI8THynZz/2PuKCYQd784zIB
         m4aA==
X-Gm-Message-State: AOAM530MtnYQCNb5j4XagnDmS6D9kMzOvoDaahIKIMY0NyHbwrp59bpz
	l1BmMCAc//+FEMNQHYRwQ7fGkV97u5ICXw==
X-Google-Smtp-Source: ABdhPJwuJQIkvKNCd38PAlJCee1YoXUNLbPnbURTrKEMmsRqPrKUU3RQVv0ETq9fLDDuuXbMnuJMoQ==
X-Received: by 2002:a63:788d:: with SMTP id t135mr6043725pgc.126.1634847752277;
        Thu, 21 Oct 2021 13:22:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f7sm2314351pfj.63.2021.10.21.13.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 13:22:31 -0700 (PDT)
Date: Thu, 21 Oct 2021 13:22:31 -0700
From: Kees Cook <keescook@chromium.org>
To: tools@linux.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Subject: injected body trailers
Message-ID: <202110211313.B5C5C61@keescook>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi!

So, I just saw a DKIM failure, and it was entirely justified. :)

Grabbing thread from lore.kernel.org/all/20211021142516.1843042-1-ardb%40kernel.org/t.mbox.gz
Checking for newer revisions on https://lore.kernel.org/all/
Analyzing 1 messages in the thread
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH] ARM: stackprotector: prefer compiler for TLS based per-task protector
    ✓ Signed: openpgp/ardb@kernel.org
    ✗ BADSIG: DKIM/kernel.org      
    ✓ Signed: DKIM/lists.infradead.org (From: ardb@kernel.org)
---

This is https://lore.kernel.org/all/20211021142516.1843042-1-ardb@kernel.org/
and for some reason, the linux-arm-kernel mailing list is injecting a
body trailer.

I just downloaded this directly and removed the trailer, and the DKIM
passed. This experience has raise a few questions...

1) Can (should) b4 grow logic to progressively strip lines off the end
   of a body until DKIM passes?

2) Can the linux-arm-kernel mailing list please stop breaking DKIM?
   Who should authorize this change (rmk, Catalin)? And who can make
   the change (peterz)?
   (I realize now that all the mail from linux-arm-kernel has been
   getting dropped into my Spam folder -- I normally don't notice since
   I'm usually CCed directly or via some other list on things I wanted
   to see.)

3) Are there other lists for which lore is collecting emails where DKIM
   is persistently broken, and can we fix those lists too?

Thoughts?

-Kees

-- 
Kees Cook
