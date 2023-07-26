Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6A198A2
	for <tools@linux.kernel.org>; Wed, 26 Jul 2023 20:30:05 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-63d2b7d77bfso1480176d6.3
        for <tools@linux.kernel.org>; Wed, 26 Jul 2023 13:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690403404; x=1691008204;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TKfZWlGOr+xmj4/h5zS4eiKTSG+y8EbYa1JdHvMkFvE=;
        b=ZjGBJ5IoaVEGGZf/38AvEoGCW+taYamcVaNb6CkaGpmY6VWENVlzZe5hUs82peDLfx
         HiQ5r/yoUW4VJuGry/n0uqTz/v04xoWyxCwNJGSDz9H1lPSFK8aqHp0hJlVssNouU1eW
         TZYNM562MEYNk4xHGQcxe1fOKOn2hH8dbLfHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690403404; x=1691008204;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TKfZWlGOr+xmj4/h5zS4eiKTSG+y8EbYa1JdHvMkFvE=;
        b=Zid46M3ajFhwZ42OJHvd6HlnopPYw4XAKu7RvXLpLMDsTWXk/P5MJQDBH5j3xNUxp9
         d4R/ecq5JIUsUQSA5ZJOMFoUOxnDFYBEh6Q35AaBNDhTVvG35yIieFhA5nvs1xOAPB0G
         ROiD6R9CHbpMdjIg0zfrLIVhfwZFrm4tc/HbHjku6krzFNCYvofNG4uAJOTK0ddWWxkO
         oZUvuCgxQF3xtWsC4KPTuaYc0O9JVRcsA40TNBav21mmdSSTb92ZgHaUicCZwn1TNCEB
         n0NM5fUSl9NPhT8jBiQ4EZ8kPGwCBW6aXZ99YHJSfh8GlCMfuGu1Jf/Zj6hsgUpQj+j2
         7iTA==
X-Gm-Message-State: ABy/qLaU8e0VQ4YWnflVQDYMKobc4LnMG3R7MSCivRFhp5zaiE/msq5z
	4lsRwYshdIxovFuuttM9QqkXrYIA9SFylm3FM8w=
X-Google-Smtp-Source: APBJJlHIV43ja+zl4PIhIAyAgRWr0WgBhxEIZELcEdzPyPDt8ucru+Yxg5cn4WGUhj2wXOdKu+qpCg==
X-Received: by 2002:a0c:8d41:0:b0:63d:10f2:8aa3 with SMTP id s1-20020a0c8d41000000b0063d10f28aa3mr2823403qvb.14.1690403404483;
        Wed, 26 Jul 2023 13:30:04 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id t10-20020a0cde0a000000b00636064e3d2bsm836985qvk.106.2023.07.26.13.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 13:30:03 -0700 (PDT)
Date: Wed, 26 Jul 2023 16:29:55 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: tools@linux.kernel.org
Subject: Re: [BUG b4] Encoding issues with --auto-to-cc
Message-ID: <20230726-gush-slouching-a5cd41@meerkat>
References: <1940519.PYKUYFuaPT@radijator>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1940519.PYKUYFuaPT@radijator>

On Mon, Jul 24, 2023 at 12:49:41PM +0200, Duje Mihanović wrote:
> I decided to try using b4 to submit a patchset for adding Marvell PXA1908 ARM 
> SoC support. Having enrolled an existing branch, I ran `b4 prep -c` and got 
> the following error (this is with the -d switch added):

So, there's apparently something very interesting about that final ć in your
name that trips up get_maintainer.pl. For example, run the following:

$ ./scripts/get_maintainer.pl -f Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml

You will get back a byte sequence \x87 where your name should be:

    "<87>" <duje.mihanovic@skole.hr> (in file)

This is because ć is 0xC4 0x87, but I have no idea why get_maintainer.pl trips
up and splits the unicode sequence into two bytes. It seems to want to do that
for anything above base extended ascii (Latin-A).

I can "fix" this in b4 by forcing it to ignore any unrecognized unicode errors
in get_maintainer.pl output, but it's not a real fix for the underlying
problem.

-K
