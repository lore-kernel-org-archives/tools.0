Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249E31848
	for <tools@linux.kernel.org>; Wed, 22 Feb 2023 02:25:28 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id ay9so6435603qtb.9
        for <tools@linux.kernel.org>; Tue, 21 Feb 2023 18:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V0Xrs2f7ryFfsi+NIZOvANP4WBNe07wejoIDuPepXY0=;
        b=UonnsjedomfxZGrygoh4pQZ4Xr8GmFkEcxPxZ+f0HSJXli++YccDwbPqUsZ0/riagx
         hFXVb943R7s4HfktLsHgOKAL4qx6iekrlQOHfgOJmyNsOu2+N3JqXcEO3hikG3w+2yav
         KJfirwJGtKEGo+LtwFv3Uj4h1xu/yCqoMYGeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0Xrs2f7ryFfsi+NIZOvANP4WBNe07wejoIDuPepXY0=;
        b=6OsRcIyYWvryQiE6u5vfF+H3K9XPq/Q6ZVqF8cfo7kn3P9N8Yl20dVLOJdEsGomhwB
         IxYTwOpc7IkdwpV5OcHKW6X+BgvoiYMXYz/2pY3vJkCvgP82etuETJTzxTLPCagA/3Dv
         bxK7c2fbzsR7VW/pGfcT6y/aUiTXEmApGnoW8g18/fi2PjYYoCkM9omvAlLNkso7kgDX
         JaEA7EpNt2ifGpxWN5DW2y3eD4rPu+6orf+Ou+Wslq+tYiL5oP0cPhi05Ta7FGndoCfS
         jHXzGsj3pyXPZ6l14LRj+25SPo1tTQnqAsyBPpKCqx6DUyTTrmmFyiP3Q3C9TNbeItV8
         zxEA==
X-Gm-Message-State: AO0yUKWt+Teazo6vcYbhpIm23/aK+uHlEFyofXeM+j7O2qVioizwGbgY
	msf5B2QPdzcv8dqzcPjerb2nBgE/PO3mFe3Z
X-Google-Smtp-Source: AK7set/pbtgiMzcGkfk6S9j+WcPRpKaCH4+Z15N2bD9Q9onJaihmL9TxNdn4atR2IE4CQ+siRJMdvg==
X-Received: by 2002:ac8:5a09:0:b0:3b6:3596:182b with SMTP id n9-20020ac85a09000000b003b63596182bmr23957769qta.36.1677032727030;
        Tue, 21 Feb 2023 18:25:27 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id 13-20020a05620a040d00b0073b575f3603sm3707011qkp.101.2023.02.21.18.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 18:25:26 -0800 (PST)
Date: Tue, 21 Feb 2023 21:25:25 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: "Kernel.org Tools" <tools@linux.kernel.org>
Subject: Re: [PATCH b4 0/3] ez: allow sending all versions of a patch series
 in the same thread
Message-ID: <20230222022525.p7jtphm7rc4dfurw@meerkat.local>
References: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>

On Tue, Feb 21, 2023 at 08:29:16PM -0500, Philippe Blain wrote:
> Sending a new iteration of a series in the same thread as the previous
> one is the preferred workflow on some lists, the Git mailing list being
> an example [1].
> 
> This series allows that workflow in b4 by adding a '--same-thread'
> option to 'b4 send', with an associated config option.

Thanks, Philippe.

I think I prefer to *just* have this be set in config, without the CLI switch.
The goal is to make "b4 prep" workflow be friendly to newbies, so having
--help output a ton of options is the situation I want to avoid.

I'll take this in if you drop the --same-thread switch.

Cheers,
-K
