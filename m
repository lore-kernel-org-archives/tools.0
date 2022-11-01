Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB59B7C
	for <tools@linux.kernel.org>; Tue,  1 Nov 2022 12:30:42 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id h24so9142071qta.7
        for <tools@linux.kernel.org>; Tue, 01 Nov 2022 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E0MVcqZkcDPOPSgzRXDEe65d21fujTQpJBF1uKl2lS0=;
        b=ijZzMbKjYJhMGE+szQRFvLqhhjYwDH/TfdQsP+W3cMTpSta/tVYRKoHO5U83NtWlqV
         aGwTqOmt7lhYfqRKKZqlwMlPR7bBsW+TWjSj/nfsuvc5wSNeWS3xLiitskst6NUeeAuK
         NuDflRrg0meVvuSCgq7r6vEbHws1QccUG9DlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E0MVcqZkcDPOPSgzRXDEe65d21fujTQpJBF1uKl2lS0=;
        b=5Qx4vtlboWsibCHo9iAKLCFpEpbJY1yWDTPlK0pObnDLBG8VLUmngKABH6lz3NDQ9y
         rDngPKMIvLXCSyzrcqQBncRgZHZ2ojUnc2tnwJd5J0zRjxiNbZx+5Z7rZSTGECGSTVT0
         cq0Po2YLqY/82muSQYh+DN4Iku6ZfMTVrrOZUoBn6xEuCZ/9PwQlGMTzpJnJZT/aT3Kj
         GJ1x5nIbM2YPgW6E42Wm9B7jRprcKnbxZp74j64T6/PAZ8XcNsvpDk+oDhVfVHd0eKKb
         o/YyRW8W+9kYQXjYOtcUbo29y9B+L8XfJci1sLMnwm69bGUqTWLt7jYsrqlA0qcWdDhW
         Kaug==
X-Gm-Message-State: ACrzQf0Vk7oNFQGlK2ssPDolQf1zzO8dAm/9nVWK4q6/dRC2R1xPYme1
	O2/wtrS5232WHwBS63ZrejXMhCrFwORx4Q==
X-Google-Smtp-Source: AMsMyM7MviYflCNLUwIRaw8I5UL/A2lSyIFhUwA9BFRgI7AJvRfsUJiQY4j5/JQJDi4/PyUc/SgFLA==
X-Received: by 2002:a05:622a:170d:b0:3a5:e6b:641d with SMTP id h13-20020a05622a170d00b003a50e6b641dmr14665702qtk.449.1667305841574;
        Tue, 01 Nov 2022 05:30:41 -0700 (PDT)
Received: from meerkat.local ([142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bi23-20020a05620a319700b006eeca296c00sm6427699qkb.104.2022.11.01.05.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:30:40 -0700 (PDT)
Date: Tue, 1 Nov 2022 08:30:35 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: tools@linux.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: b4 ignoring Reviewed-by: in quoted-printable email
Message-ID: <20221101123035.xkytwxrhrkhjadc3@meerkat.local>
References: <CAMuHMdUsfc-NNHswtS8jjhWFwk4fX2yvynKh4q0x_u01bnUQBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUsfc-NNHswtS8jjhWFwk4fX2yvynKh4q0x_u01bnUQBA@mail.gmail.com>

On Tue, Nov 01, 2022 at 10:14:51AM +0100, Geert Uytterhoeven wrote:
> Hi Konstantin,
> 
> $ b4 am OS0PR01MB5571A141EC9159DB281867C8DF379@OS0PR01MB5571.jpnprd01.prod.outlook.com
> Analyzing 2 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v2] clk: renesas: r9a06g032: Repair grave increment error
>   ---
>   ✓ Signed: DKIM/denx.de
> ---
> Total patches: 1
> ---
>  Link: https://lore.kernel.org/r/20221028113834.7496-1-marex@denx.de
>  Base: not specified
>        git am ./v2_20221028_marex_clk_renesas_r9a06g032_repair_grave_increment_error.mbx
> 
> The Reviewed-by tag given by Gareth is not picked up by b4.

It's actually because that message has a subject that doesn't indicate a
follow-up (doesn't have a Re:):

    Subject: [PATCH v2] clk: renesas: r9a06g032: Repair grave increment error

I'll see if we can recognize this situation, but it's definitely an odd
corner-case.

-K
