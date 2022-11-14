Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B88E4C97
	for <tools@linux.kernel.org>; Mon, 14 Nov 2022 14:49:14 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id h21so6869744qtu.2
        for <tools@linux.kernel.org>; Mon, 14 Nov 2022 06:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R1F5Vh85CXr0+daftfYY6vwRQu10kJGaVGhiYbQKKX4=;
        b=h/A3GNkJnrCh4GQ+WARTbUxyF67eDLjqEV9VJVkp/cS4aIKdP5MBhTL8cI9/bKkbpF
         mEbmfqCXcmw7LbK7+6dJ2Q2gEPPpeb3R2SrPxWEGUmDTr86QJdTBES07sXO+b0Gh/5ns
         2R9JDvCNNo05ESOkK8ZutImLQ/BwZfWt0+jX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1F5Vh85CXr0+daftfYY6vwRQu10kJGaVGhiYbQKKX4=;
        b=NN6cwcdHs2k5Z/JWEo2U2/abo6YrU0jqnt72OCjVfXhW95lK8KkXc6k5dtqna9RVZZ
         5YkzSLQ0IBv8YwuuaxrmlhFdPjFKlJEg3Q9BEBy3e5B6fN2gBPIBRXPff82K2MJDdrH0
         xUlInVo70hQDK2ud5tRdNo/CXyM459NrU4xDYhJThNYdIGuKYxpMJnRmvj3qSnRSiF/p
         aJk+Zf2+6hIq+3s82+TXSkgOGSpoD6XGyEbGkrRmHNAN2GZ8zp7RuTX5tIWcl1TWSduW
         WV3nmsmEV+YmoybWRSxwYuVFex0WjgDCtPz3XO44BvRvF7PJ6Oe8lwqMJcF7nxhJSs+O
         rCrg==
X-Gm-Message-State: ANoB5plYhD49HzwV86g3vzIKil5ojy/Utx/7ycOVzmLnwRK4hBZDtlOt
	TbWPBPNhRqrNaoNdu6maFTjke9/jQ8MVtA==
X-Google-Smtp-Source: AA0mqf7AUsYPEY06S5dhShuwHBLOKw3PEaNJFvLLt6us2RfTurqJLhHEMce/VvPncBeHxgnvUcqePA==
X-Received: by 2002:ac8:7443:0:b0:3a5:7a9c:242d with SMTP id h3-20020ac87443000000b003a57a9c242dmr12422005qtr.361.1668437353168;
        Mon, 14 Nov 2022 06:49:13 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id z2-20020ae9c102000000b006eeae49537bsm6445881qki.98.2022.11.14.06.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 06:49:12 -0800 (PST)
Date: Mon, 14 Nov 2022 09:49:11 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Oliver Smith <ollieparanoid@postmarketos.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH b4 0/1] How about adding SourceHut lists as 2nd backend?
Message-ID: <20221114144911.jdvdjkqi6mkzjtv6@meerkat.local>
References: <20221112131114.2370-1-ollieparanoid@postmarketos.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221112131114.2370-1-ollieparanoid@postmarketos.org>

On Sat, Nov 12, 2022 at 02:11:13PM +0100, Oliver Smith wrote:
> Hi,
> 
> I found that with relatively few changes it's possible to add SourceHut
> as alternative backend to b4. Is this desirable to have in b4?

Absolutely, I am all for making b4 work with sourcehut. I haven't yet had a
chance to review your patch, but I hope to be able to work on it today or
tomorrow. Some features will require rethinking for sure (e.g. we assume we're
always talking to a public-inbox instance, so when it's not the case we'll
have to adjust features like querying the remote for updates based on
change-id).

Cheers,
-K
