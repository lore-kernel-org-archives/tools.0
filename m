Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D63A3C0B
	for <tools@linux.kernel.org>; Mon,  9 Jan 2023 17:15:05 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id c7so8310449qtw.8
        for <tools@linux.kernel.org>; Mon, 09 Jan 2023 09:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uagduGYBaToIciSTPKWkit3IdUCkGvun+f7ohWPFPb4=;
        b=EX3iF9cHW9/QfL8W/xLC1qK8JsPMyjHmHdK4kuUmgv/fSIaliMh1NO2jbjnG/V+/dp
         yS5JeoYLOoFJXYWZ/VO6Tjt2QWBjYXgBPQaB7Vez9po86g5KPsxxf8JdDOemjR4+tJcu
         E+NUGEv8Ctv0WkW3zcWNQKsNOjVYquHI/ljMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uagduGYBaToIciSTPKWkit3IdUCkGvun+f7ohWPFPb4=;
        b=Vg3bUqYcGPn7xJOS+2FlPMDzSbwcpg5upueqr1ujwWMtFKgueRmC/Vsnpfv8lQ2I3b
         1Om6k62U7tFFO3GU1P3dcFV9dLs/1qRs4wESMO/jccJtM/Zy54Fsho4n218kM/twjiSX
         03hmB5zStan339IqHa9GHs9qYXqHiHOJqYd2C7XrNc9Hm1AtgabfP2wFJXZ/uamF5uU7
         49vcmsGxgAhcZuGfrZg1JtpRU8Nad+zKlczyM2FbQdpVvdLjgd4/tIt1WHAanNSVg82j
         uf9X3w5gIL3M0atIH2blKSgvSO7cHTAI90f8hEg8aoVkaOSk7dJmkuIjSbP64haNYJ/z
         YLYg==
X-Gm-Message-State: AFqh2kpiQlRj9a6ko7zsU8+HL66VTKXZ3zDbtXXpjdj3oT5iyZOwqk85
	JNXcqMkmeUyAxdvE8Q5WnzVdsG4T8qxqHQhn
X-Google-Smtp-Source: AMrXdXuDhJoF03Ced4lPUbISllk48HgtHMEsVHONOvl7Xw5SatAOvrEj/NRqmmoIq34reGKEMn0O5w==
X-Received: by 2002:ac8:4793:0:b0:3a8:1c63:7603 with SMTP id k19-20020ac84793000000b003a81c637603mr95818294qtq.57.1673284504788;
        Mon, 09 Jan 2023 09:15:04 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id o7-20020ac841c7000000b003a82562c90fsm4787215qtm.62.2023.01.09.09.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 09:15:04 -0800 (PST)
Date: Mon, 9 Jan 2023 12:15:02 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: "Kernel.org Tools" <tools@linux.kernel.org>
Subject: Re: [BUG b4] misformatted email recipients
Message-ID: <20230109171502.4ccqujppjr7ag7ft@meerkat.local>
References: <20230109141516.ddljbbkzwk74bfwe@snowball.t-8ch.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109141516.ddljbbkzwk74bfwe@snowball.t-8ch.de>

On Mon, Jan 09, 2023 at 02:15:16PM +0000, Thomas Weißschuh wrote:
> Hi,
> 
> it seems in certain cases b4 will misfold/misformat email recipient.
> The exact conditions are that a long address line pushes the comma
> separating different addresses to a new line during folding and that
> line contains unicode data that is encoded.
> In this case the comma is also encoded.
> 
> The root cause is a bug in Python email module [0].

Ugh, sometimes I feel like I'm the first person to actually use Python for
sending email. The parsing modules are great, but the number of ways it gets
outgoing formatting wrong is just amazing. Thank you for reporting it
upstream.

> Such misformatted mails are rejected by some mail servers, for example
> infradead.org.
> Also it seems they are not indexed by public-inbox [1].
> 
> I hit this case in the wild [2].

I'll have to figure out what to do about this. Clearly, we can't wait for this
to be fixed upstream.

-K
