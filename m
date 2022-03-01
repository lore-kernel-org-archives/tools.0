Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A84017E
	for <tools@linux.kernel.org>; Tue,  1 Mar 2022 09:16:56 +0000 (UTC)
Received: from [192.168.43.69] (unknown [182.2.70.248])
	by gnuweeb.org (Postfix) with ESMTPSA id 80E8A7E29A;
	Tue,  1 Mar 2022 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1646126216;
	bh=3EtEksgWSmxB/Qh/XBWNVqGXberm/6TlAGbpzFUezO4=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=Oah2mJvY6Z8c2LmwAF7I+vzPzX52PPn7sc6IwG0UMxUsDwuvkNaiCh1ey/S+Z29Bt
	 2RPw2CArZdHQsVs48o5BkbHleED9u1+BZeh4dHLLQDc1vDZPAV0pTf0KxWTglsVXaE
	 Obw+fLucgU6+VRz3zqWqWhKgJBItxXRE8ULfzRjV0nU9p7rx94rv97cpHpXAcBI8hE
	 PPHxkMcHCQg2Wcmmu9hkezbEEK2Jnmqb9noS4BYmpvd5gh/ZxbzpbHVyVz+c71Wtbl
	 YoArJjzahHlVWVxzMZViU39Jl/wWRPiysUt5B3KD5St2dpzi53+KNblxIVnJqJovBH
	 4C4QrCxBKKJ1g==
Message-ID: <93a60cc2-52df-878e-6b07-dd80d5d3f149@gnuweeb.org>
Date: Tue, 1 Mar 2022 16:16:47 +0700
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
Cc: weidonghui <weidonghui@allwinnertech.com>, tools@linux.kernel.org,
 linux-kernel@vger.kernel.org, gwml@vger.gnuweeb.org, x86@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski
 <luto@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20220301041119.55085-1-ammarfaizi2@gnuweeb.org>
 <Yh3cPSf/qKNPv1C9@nazgul.tnic>
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Subject: Re: [PATCH] scripts/decodecode: Make objdump always use operand-size
 suffix
In-Reply-To: <Yh3cPSf/qKNPv1C9@nazgul.tnic>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/1/22 3:41 PM, Borislav Petkov wrote:
> On Tue, Mar 01, 2022 at 11:11:19AM +0700, Ammar Faizi wrote:
>> For better reading, always use operand-size suffix for the generated
> 
> What does "better reading" mean here exactly?
> 
> See, there's a reason why -M suffix is not default in objdump. And in
> my experience, I've never looked at objdump output and thought, "hm, so
> the operand size insn mnemonic suffix is missing here". And if at all,
> one usually wants to know the operand size of a single instruction - not
> the whole bunch - and for that we tend to look at the vendor manuals
> directly...
> 
> So I don't think this brings any improvement to the output but hey, I
> could be missing a reason.
> 

I am aware that for particular cases, we can deduce the operand-size from its
operand. So using operand-size is not always mandatory.

I would say always using operand-size is our habit in writing Assembly code.
Especially for the Linux kernel. Looking at entry_64.S, entry_32.S and many
Assembly files here, we always use the operand-size. It also helps to determine
the size quickly. It gives us extra information about the operand size when
sometimes it can be vague.

For me (and probably other people who always take care of the operand-size),
it is a convenience to have them in the objdump as well :)

I don't think it's that urgent to have, but having it should not bother people
who don't care with the operand-size suffix anyway.

-- 
Ammar Faizi
