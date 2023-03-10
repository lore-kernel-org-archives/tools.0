Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5768838
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 19:32:49 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso10950344pjb.2
        for <tools@linux.kernel.org>; Fri, 10 Mar 2023 11:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678476769;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGe/ZtMK6S0IZoq3fLmJVC8pYj0Y1oeavCIdcx65v2g=;
        b=GC+cWX69f/jLWi/IT5ai9EcM2Fun8wcUkeUbjLfh8elIpoUJyG/0UsYO/eQ+8AnSin
         KtwYT0HgBFUQ9l+a0VoML/sv1xOtaaGA2z5jQykLrkiEirzN46Vxvy2jUVVkN0uqcUCU
         iImkZAnk/LNL9edAaThhJXbDwmJtcpzZTtTsv5p4Oi2WxgPKAviClX9hbCpHBc60O4+3
         L/9t9BNRi1Mx4pShCa64SZ2yS3amPMHrow3cRK/NUZBMdXW0gI0P5Sfbvkk5I93326GT
         dAbow9cv921r8BCjkyvI19XrDm2pByTkfXra2x3RJv2lRHz/9KSpcHDHZyLAryfWPWvu
         QzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678476769;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGe/ZtMK6S0IZoq3fLmJVC8pYj0Y1oeavCIdcx65v2g=;
        b=3pRZI6qqgSBNJkqXYx91lv7R+nunMkE8sD7cQ5m0WwXVoWsBha3/79KV6p0BMGCPOx
         vZ/2YJBJQPE2/E9zQU6U0zOB5blmlSLQUvk9YzRLDPFiFUkQrwJeXlNt6V0UnpqD35Mq
         WrPnffz+owsu/JgDqGowgj08nBKg+z5GZItCGnaagRFX9roRuYWlPsT5wvAwhGmchoj8
         1Mc6woj6q6GJTNLPNGsaLt5T9KEqnU2nojaHGSIwbdXGFtBxt69ioe+oXkWW26yJQMKh
         xbzVJYvjL9rJ6v7qdDvBVM3CSks14Mpf0bvug02Lzl4xb3BW+nLYE/Dza+yD1XzD+CKN
         x/Pg==
X-Gm-Message-State: AO0yUKV/D8GyybHiLVisM1+kmOSxbz6tvS9RVXwy9zN8ezYXAWEZpFsP
	js/GIdGrKZ5f2qSTf6VLK2SJxiVXVECuI7ImBEg=
X-Google-Smtp-Source: AK7set/kCYqMOEpXZ/FMsOEcgWLR13ashkjX0IKq8PfGurXmxdLVAt+tuGRr4KBguxoSZOsycQ5j0Q==
X-Received: by 2002:a17:90b:4a0c:b0:234:5d3c:b02b with SMTP id kk12-20020a17090b4a0c00b002345d3cb02bmr26979033pjb.42.1678476768875;
        Fri, 10 Mar 2023 11:32:48 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id m15-20020a17090ab78f00b002369e16b276sm277924pjr.32.2023.03.10.11.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:32:48 -0800 (PST)
Date: Fri, 10 Mar 2023 11:32:48 -0800 (PST)
X-Google-Original-Date: Fri, 10 Mar 2023 11:31:59 PST (-0800)
Subject:     Re: b4 shazam picking up the wrong author from patchwork/lore
In-Reply-To: <20230310192652.ymac3w2lucfdf34p@meerkat.local>
CC: tools@linux.kernel.org, Conor Dooley <conor@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: konstantin@linuxfoundation.org
Message-ID: <mhng-2296988e-80b6-4e13-9f3c-b61dc0b40c5e@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 10 Mar 2023 11:26:52 PST (-0800), konstantin@linuxfoundation.org wrote:
> On Fri, Mar 10, 2023 at 09:38:54AM -0800, Palmer Dabbelt wrote:
>> Conor just pointed out that 2a8db5ec4a28 ("RISC-V: Don't check text_mutex
>> during stop_machine") was listed as authored by him, despite having a From
>> in the message body.  That usually works fine so I'm not sure
>> what happened here -- no big deal because neither of us really care about the
>> authorship on this one (and the SOBs are fine), but figured it'd be best to say
>> something in case it bites someone else.
>>
>> I merged the patch with
>>
>>    b4 shazam -lts https://patchwork.kernel.org/project/linux-riscv/patch/20230303143754.4005217-1-conor.dooley@microchip.com/
>>
>> which is the way I usually do things.  This is the first time I've noticed any
>> sort of issue like this.
>
> Ooh, very neat catch. This would only happen under the following conditions:
>
> - the message had to be patatt-signed
> - you had to have had the key to properly validate it
> - and, most importantly, there had to be mailman trailers in the message
>
> When all of this was true, we would re-trim the body to the size that was
> actually passing verification (using the l= parameter from the patatt
> signature), but this lost the in-body From/Subject headers (because they were
> moved into the actual message headers during verification). There were
> workarounds initially for this happening, but they stopped working right
> around 0.10.
>
> This is now fixed in master and backported to 0.12.y. I will hopefully push
> out a 0.12.2 some time today.
>
> Thank you for the report.

Thanks for fixing it so fast!
