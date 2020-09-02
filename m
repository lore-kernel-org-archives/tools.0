Received: from pb-smtp20.pobox.com (pb-smtp20.pobox.com [173.228.157.52])
 by mx.groups.io with SMTP id smtpd.web10.7438.1599053396984644436
 for <tools@linux.kernel.org>;
 Wed, 02 Sep 2020 06:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kyleam.com header.s=mesmtp header.b=jCy8Zemh;
 spf=pass (domain: kyleam.com, ip: 173.228.157.52, mailfrom: kyle@kyleam.com)
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 79B0EFF17D;
	Wed,  2 Sep 2020 09:29:56 -0400 (EDT)
	(envelope-from kyle@kyleam.com)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:in-reply-to:references:date:message-id:mime-version
	:content-type; s=sasl; bh=8ZKmB08DYeD1IAoDSGlTjGvdE/I=; b=nLwxL4
	aMddQL24tGXXFsQUBP7jtc66n7bibvGLqQEQoNHgMzoWiKXOwWTEyJ0hJ3gRwfCt
	netd2ikpEAO12ziYgLoWDekQLhEGQXXSl9p80cPmOhKrMWk8D83QTYMl1LFuMwR8
	bQ9yzfIEW61cfssg8kvHeySYcJBY6EK7r6gXQ=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
	by pb-smtp20.pobox.com (Postfix) with ESMTP id 72139FF17C;
	Wed,  2 Sep 2020 09:29:56 -0400 (EDT)
	(envelope-from kyle@kyleam.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=kyleam.com;
 h=from:to:cc:subject:in-reply-to:references:date:message-id:mime-version:content-type; s=mesmtp; bh=AcE+zyCVF7tCrNSZ8ZWov7pmOsSh3/VbgA1JXl44BNk=; b=jCy8Zemh0Ej3ITNeiNUnGPszKenEKIieMjrotnbZVztFQjKuWPUytcPcakZ2Yvfo8gdZ50NrWwGghSLGpQPbP5/MNd2teSp6vnvyoXzbBiAxMCqhKh5D4KsxuMY1DQfWmOEyfAXbveyyj0rsfZJ7+R54HA5Z7MDEvqYXEHIMg+o=
Received: from localhost (unknown [45.33.91.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp20.pobox.com (Postfix) with ESMTPSA id C90ACFF17B;
	Wed,  2 Sep 2020 09:29:53 -0400 (EDT)
	(envelope-from kyle@kyleam.com)
From: "Kyle Meyer" <kyle@kyleam.com>
To: krzk@kernel.org
Cc: mricon@kernel.org, tools@linux.kernel.org
Subject: Re: [tools] b4-am SyntaxError on Python 3.5
In-Reply-To: <20200902085531.GA13726@pi3>
References: <20200902085531.GA13726@pi3>
Date: Wed, 02 Sep 2020 09:29:52 -0400
Message-ID: <87mu28b92n.fsf@kyleam.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 
 62ABDEFA-ED20-11EA-A8D0-F0EA2EB3C613-24757444!pb-smtp20.pobox.com
Content-Type: text/plain

Krzysztof Kozlowski writes:

> Hi,
>
> I tried now b4 v0.5.2 on my Ubuntu 16.04 with Python 3.5 and:
>
>   $ b4
>   Traceback (most recent call last):
>     File "/home/krzk/.local/bin/b4", line 7, in <module>
>       from b4.command import cmd
>     File "/home/krzk/.local/lib/python3.5/site-packages/b4/__init__.py", line 625
>       ecode, out = git_run_command(gitdir, ['show', f'{when}:{fn}'])
>                                                                  ^
>   SyntaxError: invalid syntax
>
> Is Python v3.5 not supported by b4?

setup.py specifies that Python 3.6 or above is required.
