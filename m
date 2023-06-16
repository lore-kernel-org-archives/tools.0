Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E355A13AC9
	for <tools@linux.kernel.org>; Fri, 16 Jun 2023 16:53:28 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-471266e3dcdso372866e0c.1
        for <tools@linux.kernel.org>; Fri, 16 Jun 2023 09:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686934407; x=1689526407;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3jakbQfpviMYKyTeYovmCC6uED5s6dz1j1/HCQGYkPo=;
        b=RNLh9MASCYNy22DOvxXRYVF7KvSR3YyXPFDMJXj/HYV3PzVpFNEWSJKV95TwoMB28x
         9hASlmAR2wPlzjgLOn4t5ZumHW+ALelnwE+MSgGPTyfNTVQMLmjcYZn/2XMun782Vd/j
         GkgL7SjTSQ/XlkcPkcZSOKzyh2IEbP6yctgY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686934407; x=1689526407;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jakbQfpviMYKyTeYovmCC6uED5s6dz1j1/HCQGYkPo=;
        b=BF+6qVYQncHKg59ALgJBw8A6ADabeHEj0sIHqXLFWXL06UtZIwPU8PSlE4yb3v0JEI
         O9hrEhi5dcYuz3X7oVpWEz9xo4pEJYJ9Rw3tuq4TBZqRR6++42gdD9V9zfOz+ctsimrP
         cmL5ZdiVYrFMt4QfHgAnGZZMKt34sZSswrhbxi49579Q6+0T+jq542BL7LtyEpZoYdT6
         ybi5TNYGPzMqArXxQNBORnPGradw4sCg6Mq4Rjsd6kJsFKjX0f63zBunXAuF854XbXMZ
         mWNyZ8To7NGyBydA8AmWZhUVJMJFNMn8dB14SKNpdy+fnuNsCCqENEmf4DBRCQaaaHvw
         FXyw==
X-Gm-Message-State: AC+VfDxq/zY/Jq8oQ5lCIlIpPWGJVAKZ1DlckgLYwzY92Q51mqbhv530
	krVv/CH1JazoE8dGcg0xj0g95zxpa+ebp4dCPlw=
X-Google-Smtp-Source: ACHHUZ6EVHkRicEQiGcA4s/GlCgZbWrAIJ2+dsFhC8FsDeqW9I6wBY02hYzvhVxVhHHBsHm8ACEb1Q==
X-Received: by 2002:a1f:5f06:0:b0:43f:b997:beea with SMTP id t6-20020a1f5f06000000b0043fb997beeamr2300747vkb.13.1686934407472;
        Fri, 16 Jun 2023 09:53:27 -0700 (PDT)
Received: from nitro.local ([204.48.95.97])
        by smtp.gmail.com with ESMTPSA id w8-20020ac857c8000000b003f8685c403fsm7526743qta.22.2023.06.16.09.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 09:53:26 -0700 (PDT)
Date: Fri, 16 Jun 2023 12:53:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Erik Schilling <erik.schilling@linaro.org>
Cc: tools@linux.kernel.org
Subject: Re: [BUG b4] encoding issues with single-patch series
Message-ID: <20230616-jedi-chess-plea-008b5b@meerkat>
References: <CTDYR84I395O.2UI69IKNO7B8A@fedora>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CTDYR84I395O.2UI69IKNO7B8A@fedora>

On Fri, Jun 16, 2023 at 11:22:51AM +0200, Erik Schilling wrote:
> Earlier, I sent a patch where I tried to CC Alex Bennée. The generated
> mail included the header:
> 
>     Content-Transfer-Encoding: 7bit
> 
> the CC header got correctly escaped, but the mail body contained the CC
> with UTF-8 encoding:
> 
>     Cc: Alex Bennée <alex.bennee@linaro.org>

Interesting. I'll check it out.

bugbot assign to me

-K
