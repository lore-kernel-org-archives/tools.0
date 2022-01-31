Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143DD2CA1
	for <tools@linux.kernel.org>; Mon, 31 Jan 2022 20:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57B5C340E8
	for <tools@linux.kernel.org>; Mon, 31 Jan 2022 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643659671;
	bh=s8fZBuK1R+egOOa2rkdcO2UNZMP8deGU2VwT5JOXpUo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hfEuGul/uEbkkdADvLDsuoos7swqBXjtcMLq2z1t0qkfkRPPW2fEuxlMjw6F52YQz
	 elZroQKjLJs4YZn1sfxAHek37SLJSIvQM0zD6enObJfiAFOeQ1gXIM3r2CJ9hXO664
	 Z9rthsF+5Tv2trJdEqYxSmK8gCGL+2UGAibGOoE9KPEcs8yqOj2scmnCYgtpr+VLUn
	 Xukcg7SPTxklzVy+cRVy7iGFWbxmgi3mX1bGUelOGUF1FnyH27IhWqll+G6PDX5ta2
	 h+txsAUxmC9+DbalyW/NfgsOa3nsQW9q+C1wS32llMdBtYBshwl9FEWDpafLvbWKXa
	 x+D/9tHfd6SOg==
Received: by mail-ej1-f41.google.com with SMTP id m4so46595203ejb.9
        for <tools@linux.kernel.org>; Mon, 31 Jan 2022 12:07:51 -0800 (PST)
X-Gm-Message-State: AOAM5323gtF2SSQ6352yhXvAjk+N/bCfImfaHRHLgQTGWABa/tmSpNDG
	OuKVoqSsJU1CqTGenvoLMBgZF82hfM3HJIuzzQ==
X-Google-Smtp-Source: ABdhPJxmqpSkK1+rRnKwIkWd29CP1HQpUd2fpFIA961S5UilRLwgtQbA8ZdH1+bXS3uzM6aZWhl+uHfPHafq+FhXqNs=
X-Received: by 2002:a17:907:2d1e:: with SMTP id gs30mr18135144ejc.14.1643659670011;
 Mon, 31 Jan 2022 12:07:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20211214214327.4003631-1-robh@kernel.org>
In-Reply-To: <20211214214327.4003631-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 31 Jan 2022 14:07:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLJSZO_uDS2uQL0UtgJ45jycoOBQgkvs=7XUnH=+j3_Jg@mail.gmail.com>
Message-ID: <CAL_JsqLJSZO_uDS2uQL0UtgJ45jycoOBQgkvs=7XUnH=+j3_Jg@mail.gmail.com>
Subject: Re: [PATCH] Allow whitespace before a trailer
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 14, 2021 at 3:43 PM Rob Herring <robh@kernel.org> wrote:
>
> Currently, b4 fails to find and add trailers with leading whitespace. Let's
> be a bit more forgiving and allow for that case.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> This thread exhibits the problem:
> https://lore.kernel.org/r/20211206174113.2295616-1-robh%40kernel.org
>
> Note that patchwork also fails on this. Between fixing b4 or Greg, I
> went with b4. :)

ping!

>
> ---
>  b4/__init__.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/b4/__init__.py b/b4/__init__.py
> index 11c287eb3433..a4add56c5f80 100644
> --- a/b4/__init__.py
> +++ b/b4/__init__.py
> @@ -1397,7 +1397,7 @@ class LoreMessage:
>          was_trailer = False
>          for line in body.split('\n'):
>              line = line.strip('\r')
> -            matches = re.search(r'^(\w\S+):\s+(\S.*)', line, flags=re.I)
> +            matches = re.search(r'^\s?(\w\S+):\s+(\S.*)', line, flags=re.I)
>              if matches:
>                  groups = list(matches.groups())
>                  # We only accept headers if we haven't seen any non-trailer lines
> --
> 2.32.0
>
