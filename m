Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B853A3
	for <tools@linux.kernel.org>; Wed, 19 Oct 2022 19:32:12 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id j8so699046qvo.6
        for <tools@linux.kernel.org>; Wed, 19 Oct 2022 12:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5EjmUm1EkcwfYBGVzqPbJaGvkHlPZZfBQVYBbHX5MT8=;
        b=ZZViwwn2zsiXNQiJ0cQb6iPHBzBzOgiH3ppgdi2xDNyUyS4gpNCoAlJd3UhaXaZprI
         9buz6xKHWIPQ9tm7SkC7KNLgHNCYoalu/Fm2ih1jO1E0lq8Z5rtNbh3HM/CxKqoo7/5j
         05SZOtpOEP8GLdE1hwrQSxu0wjeDs/P9NqZSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5EjmUm1EkcwfYBGVzqPbJaGvkHlPZZfBQVYBbHX5MT8=;
        b=1Mv4BcRBn7Nu5GKZH0yh3A7At8g5aBcwVG37WGCREzBYGqRJun43UUVaOO4fbpChXw
         6h2wMg5j2c5DTOydaEkGu6XXTCTbhhZFVGC+l9skIwkCAg6v9I2qJwwfEocfXjUpg5A8
         t3KqkqhbzWBQ0wthtATZ2zyyaNdwpMnQp6l8AKqM1tWpPTSCNP0RB4/jGYe3fcpCzlC7
         xetaQDPFLB3dtYHUG9qF0NUoGbB6Q17gU+DP2Pw6kYcnrQ7AsynWCN3qdlrNuNFJVJU1
         I0tFBWD6sSwTRvVWIdjbZYV7cf8AZyDdfV321AFxzqNRrkDheay0/pOzBbxv2/KC2GO/
         4wig==
X-Gm-Message-State: ACrzQf3NiuOqrPNlCEn9ckD6yL+K3izFjoPgpp6xI+HxMuaO/ZoHfJA3
	CbsBSQcIYXa2V16UPhazw6Y3hyVQTyV8ww==
X-Google-Smtp-Source: AMsMyM4OnL4Uc1seLnhHf2i3/+V5iNIqKTBOvE4oBgXjqB7spxBH5XBof8ol5ERA6/oX3+llnsrNgg==
X-Received: by 2002:a05:6214:27c3:b0:4b3:f75a:a59a with SMTP id ge3-20020a05621427c300b004b3f75aa59amr7804956qvb.11.1666207931400;
        Wed, 19 Oct 2022 12:32:11 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id r8-20020a05620a298800b006be8713f742sm5784162qkp.38.2022.10.19.12.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 12:32:10 -0700 (PDT)
Date: Wed, 19 Oct 2022 15:32:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 send --output-dir eml's sent with git send-email creates two
 From: in the mail body
Message-ID: <20221019193208.euw2lv2d2anpzvdf@meerkat.local>
References: <9bdb42f7-661a-77ed-97e5-33ba7a31fd9e@theobroma-systems.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9bdb42f7-661a-77ed-97e5-33ba7a31fd9e@theobroma-systems.com>

On Wed, Oct 19, 2022 at 06:23:09PM +0200, Quentin Schulz wrote:
> Hi,
> 
> I recently encountered some issue with my particular setup.
> 
> https://lore.kernel.org/lkml/20221019-upstream-puma-sd-40mhz-v1-0-754a76421518@theobroma-systems.com/raw
> is the problematic mail, note the two From: lines in the mail body.
> 
> This particular patch has a git author (Jakob) different from my local git
> identity (Quentin Schulz <quentin.schulz at theobroma-systems.com>) which is
> different from the sendemail.from configuration (Quentin Schulz <foss+kernel
> at 0leil.net>).

I'm going to point fingers at git-send-email here, because it shouldn't stick
another From: into the body when it already sees a From: there. You should
report this to git maintainers as a bug.

That said...

> The eml file created by b4 send --output-dir has the From: field using the
> current git identity which I assume is the issue.

Right, we're not doing quite the right thing here either, because when there's
a sendemail.from set up, we should be using that instead of the user.name +
user.email. I'll see how we can fix this up to do the right thing.

Thank you for the report.

-K
