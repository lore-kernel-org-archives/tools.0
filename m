Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACEA17E
	for <tools@linux.kernel.org>; Tue,  1 Mar 2022 08:41:58 +0000 (UTC)
Received: from nazgul.tnic (dynamic-002-247-255-128.2.247.pool.telefonica.de [2.247.255.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0F6081EC0531;
	Tue,  1 Mar 2022 09:41:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1646124106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=fv/wsRJ+/2kkhDuBlBBli91a0adPA17Sg0dPsAfIbxY=;
	b=HGDxqWIu/qkSwkTdKw5GUczVrJQWtfFWf2W5viNl+J+6ZMgufvZdSkRwNGF9fE5K/ntTLM
	50TQ23eOIjh54Rq1YxZMXUrTR74kuPuzuweIaCmZgg1exunrx8prxwh74NbZ9FF1aRLfqg
	uYctWPRdhuBaRUXCfrx+ghws46a2h5w=
Date: Tue, 1 Mar 2022 09:41:50 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: weidonghui <weidonghui@allwinnertech.com>, tools@linux.kernel.org,
	linux-kernel@vger.kernel.org, gwml@vger.gnuweeb.org, x86@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] scripts/decodecode: Make objdump always use operand-size
 suffix
Message-ID: <Yh3cPSf/qKNPv1C9@nazgul.tnic>
References: <20220301041119.55085-1-ammarfaizi2@gnuweeb.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301041119.55085-1-ammarfaizi2@gnuweeb.org>

On Tue, Mar 01, 2022 at 11:11:19AM +0700, Ammar Faizi wrote:
> For better reading, always use operand-size suffix for the generated

What does "better reading" mean here exactly?

See, there's a reason why -M suffix is not default in objdump. And in
my experience, I've never looked at objdump output and thought, "hm, so
the operand size insn mnemonic suffix is missing here". And if at all,
one usually wants to know the operand size of a single instruction - not
the whole bunch - and for that we tend to look at the vendor manuals
directly...

So I don't think this brings any improvement to the output but hey, I
could be missing a reason.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
