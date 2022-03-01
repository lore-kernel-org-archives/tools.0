Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2245A12
	for <tools@linux.kernel.org>; Tue,  1 Mar 2022 10:44:33 +0000 (UTC)
Received: from nazgul.tnic (dynamic-002-247-255-128.2.247.pool.telefonica.de [2.247.255.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 97ACD1EC0535;
	Tue,  1 Mar 2022 11:44:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1646131467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=COL0bKCNw9tVGyDaogHsf/pHZogjAgEYs82ukZGeJJw=;
	b=RnkBQHsSb7NQZL/bKJCRSATiFYPyNzQfoescyaIa+ZLGKK76rE+IFOaXKLbIOKY6Nl3kSG
	VLF4ejtAq9J/Mo37mEH7PJGW2PlwFm1s97kCmmFLa/m4z6fqF/AA1eert/Q6baTJhKHZXv
	Bu9mgoqETfJGrJ0OJMyLAgZ5ZncwyVE=
Date: Tue, 1 Mar 2022 11:44:31 +0100
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
Message-ID: <Yh35BQrhlus2uCca@nazgul.tnic>
References: <20220301041119.55085-1-ammarfaizi2@gnuweeb.org>
 <Yh3cPSf/qKNPv1C9@nazgul.tnic>
 <93a60cc2-52df-878e-6b07-dd80d5d3f149@gnuweeb.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <93a60cc2-52df-878e-6b07-dd80d5d3f149@gnuweeb.org>

On Tue, Mar 01, 2022 at 04:16:47PM +0700, Ammar Faizi wrote:
> I would say always using operand-size is our habit in writing Assembly code.

"our" is who?

> Especially for the Linux kernel. Looking at entry_64.S, entry_32.S and many
> Assembly files here, we always use the operand-size. It also helps to determine
> the size quickly.

When do you ever need to determine the operand size quickly?

> It gives us extra information about the operand size when
> sometimes it can be vague.

So I'm looking at output of

objdump -d arch/x86/entry/entry_64.o

and it does by default add suffixes when it is not perfectly clear what
the operand size is, for example:

	6a 2b                   pushq  $0x2b

vs

	41 51                   push   %r9

so I think the default of not explicitly adding suffixes when it is
clear what size it is, is the most optimal one.

> I don't think it's that urgent to have, but having it should not bother people
> who don't care with the operand-size suffix anyway.

So I'd prefer if this were a command line option which turns this on
only for whoever absolutely needs it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
