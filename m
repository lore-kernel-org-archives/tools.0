Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5909D28F3
	for <tools@linux.kernel.org>; Mon,  1 May 2023 15:42:05 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-3ef34e948b1so12045221cf.2
        for <tools@linux.kernel.org>; Mon, 01 May 2023 08:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1682955724; x=1685547724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0vKob5Q0NgniM7qdJnOR00VrWIFxFuQQzJU62IQIEXo=;
        b=dqSsbWXcrlsE5ZWfdbmJDkZW82ppQJKG9O+N7MKiW8ML6OOuHfpF+WWnR5myi3NcqL
         gEnBmN1Gp0PmloMP7tg7ZZS3MRFDkTwBuPg19kVPykUv2clXufnAeSNq7rAxRW7OHHzf
         CSfL+ZcywBtPNAcEAU9z8IoAhUtcwjtGbtf58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682955724; x=1685547724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vKob5Q0NgniM7qdJnOR00VrWIFxFuQQzJU62IQIEXo=;
        b=asDzD0NeqvMsV1T845mrJwreW1M/tUnaPcohWnNNIYmj9gTCpxAdmN1r410pi8IQpY
         NSTIXnpXfIIPJ2k6OdOnDlbz7pE6/dM3MGsCTXxq+aHB0vkNGquUuZEgU/DHMfoBu/Oj
         vz16ROe4+eJtlUflCurMO7dI5FKp7OuzeZu/9snutgahXXtlkE5ZUP8h549N4SiZ+WB5
         hRKuL3+UGkXqSBJHMv/Mcj8Hee+4wTGh2SoX+/6S43K9LhD3ZU/TNuueYhCpavg1xkKG
         EUgSemu23PHQYUhu8b9eYz7KMoBqGIMZ7ixvAdQUT3npP+nRi58k6bniXaLfkupbjL5O
         uCKw==
X-Gm-Message-State: AC+VfDw9GIKW24Q4IwtJx5iwv5Uhs7ra9Rlelfp4ZMlLmOtdr7Z7461r
	DlfQMpN81eKTa7FagssepO4L8zgWfRH4cDNk+Sc=
X-Google-Smtp-Source: ACHHUZ7y0vVJg3+eINArLIU74RcbfW9qXj7G+MeBXpmdCEPxhAKdpaHqvCV/b6st4CQMum0PtVWzUw==
X-Received: by 2002:a05:622a:4d3:b0:3bf:db0a:c105 with SMTP id q19-20020a05622a04d300b003bfdb0ac105mr22083310qtx.6.1682955724187;
        Mon, 01 May 2023 08:42:04 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id bj11-20020a05620a190b00b0074e21c3bc8asm8942833qkb.126.2023.05.01.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 08:42:03 -0700 (PDT)
Date: Mon, 1 May 2023 11:42:02 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: tools@linux.kernel.org
Subject: Re: feature request: b4 send should print lore link
Message-ID: <20230501-quickly-canola-1f487e@meerkat>
References: <CAKwvOdnsFk4zV24SDUf1iBYwTT=7eVKRxoKyJYkVnwqw_dbmzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdnsFk4zV24SDUf1iBYwTT=7eVKRxoKyJYkVnwqw_dbmzw@mail.gmail.com>

On Fri, Apr 28, 2023 at 11:15:01AM -0700, Nick Desaulniers wrote:
> Instead of "Recording series message-id in cover letter tracking"
> maybe "Sent to https://lore.kernel.org/all/20230428-awx-v1-1-1f490286ba62@google.com/"
> (or in addition)?

I don't really have any specific objections to doing this, other than that the
link will go nowhere for the first 5-10 minutes due to SMTP and lore
replication delays. My worry is that this will make someone think that
something didn't work and they need to resend.

I'll see what makes sense here.

-K
