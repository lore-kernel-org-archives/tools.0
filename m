Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553CD2C99
	for <tools@linux.kernel.org>; Tue,  2 Nov 2021 14:09:11 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id k29so13334576qve.6
        for <tools@linux.kernel.org>; Tue, 02 Nov 2021 07:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=2fcJ7HrpCmnETpsqtC5q8uymJvdgUpZmTHzzVcs4PHc=;
        b=IQs+u8mM7R5NtEWttbb4CUH5bTMVZ2Gtp1x7d9hfcqUz6JehWz+jABnoQQyB0Tr1Hc
         GXMNzuEmIeHs0vfjBihPY4jDENge/bZv5tn84pZzby63Flr5IsCcFJjL7Jy9IOOgebjk
         jwnvCUjMf7e4K9d/cT4Xn4uwKEg5q2SBGeypE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2fcJ7HrpCmnETpsqtC5q8uymJvdgUpZmTHzzVcs4PHc=;
        b=MLvxWmsR31UcpVef00u8JtD9sxEde9JfXG876/GSlZ9rzo3AwPpuESoBNPJzqspMr2
         2px10U6O66FHReTDgRhMBKL9WRxrOwMPNtXML2tcUotcVoUHEHGCETJGXhNeIDTr9Gnv
         f7ovjiwBTrI2PiYpW2xfj23IvFHOIvfhHN1IuDNcDhKo/cSUIUdWan/CxP69f6qftt9g
         t0P2C7DO0Za5WOTMR3OmLq2r2/gD+Lu7ZKCClxcoxXCLOJt7VFztOGq2Xc9DvRQovJY3
         0ACogksUQ+Wr+7Abtn0XCOcNcqW5ALLEIeS+xho2zu2Obk9mHWM7QlMhGTDcJeC8Hffc
         Xe6w==
X-Gm-Message-State: AOAM533+09tbf5jD25cVj8FlmByU6HQQLnORxz7ZRMcW6rJK2fjCHZwi
	xZFRlVN1kfTePcAIWJYTUXD+Ew2hbzk4og==
X-Google-Smtp-Source: ABdhPJz8t1CV4HWURZNA3+hnwyVectpkAEY8hr7WErkNDqrQr0ZgAhSEtNWFfqY9Aj9VDSV/1WyMaQ==
X-Received: by 2002:ad4:5e87:: with SMTP id jl7mr24508714qvb.19.1635862150183;
        Tue, 02 Nov 2021 07:09:10 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id s13sm12861115qki.23.2021.11.02.07.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 07:09:09 -0700 (PDT)
Date: Tue, 2 Nov 2021 10:09:07 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?B?w4Z2YXIgQXJuZmrDtnLDsA==?= Bjarmason <avarab@gmail.com>
Cc: Eric Wong <e@80x24.org>, users@linux.kernel.org, tools@linux.kernel.org,
	git@vger.kernel.org
Subject: Re: b4: unicode control characters -- warn or remove?
Message-ID: <20211102140907.d7turl5zhaxkcp7w@meerkat.local>
References: <20211101175020.5r4cwmy4qppi7dis@meerkat.local>
 <20211101190905.M853114@dcvr>
 <211101.86bl333als.gmgdl@evledraar.gmail.com>
 <20211101202220.dlcebvckeoz6c26k@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211101202220.dlcebvckeoz6c26k@meerkat.local>

On Mon, Nov 01, 2021 at 04:22:20PM -0400, Konstantin Ryabitsev wrote:
> I think the following would be a sane check:
> 
> 1. are there unicode control characters (CCs) present?
> 2. are there other characters from RTL languages present in the same line?
> 
> if both 1 && 2 are true, this is a legitimate use of Unicode CCs. If only 1 is
> true, then it's likely worth a warning.

I implemented this solution in b4 master, so it should error out only when it
finds control characters without any "other letter" unicode character category
present in the same line (where Hebrew, Arabic, etc live). There's probably
still a way to take advantage of this, but hopefully it's a lot less trivial
now and less likely to go unnoticed by the reviewer.

The error message will point where it found the problem:

	WARNING: Message contains suspicious unicode control characters!
			 Subject: [PATCH 1/2] SPI: Add SPI driver for Sunplus SP7021
				Line: + /* ‮ } ⁦if (isAdmin)⁩ ⁦ begin admins only */
				-----------^
				Char: RIGHT-TO-LEFT OVERRIDE (0x202e)
			 If you are sure about this, rerun with the right flag to allow.

One can rerun with --allow-unicode-control-chars to override this.

-K
