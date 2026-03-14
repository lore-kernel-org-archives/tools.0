Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC3C388362
	for <tools@linux.kernel.org>; Sat, 14 Mar 2026 22:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773528285; cv=none; b=hjJy+MXYgtevDOQiskRcgOJ5vhZ+ys/lPCQcp+tFtjrUcGovDNZUNvPBL96ydxJNkj5W9HO51j4U4omeOXW9uWfcWFfDl93TBbXD9VtTS+I+Hnaf8yzrNPvCaFPmOZwsG9FaHTraln0UcTmVXL2XVgsMLDThKYyY7P8IHwXgzoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773528285; c=relaxed/simple;
	bh=+BzfWIbWutBn9FVLenIu2cDO6fBukYew6iGg+YJ9bLU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rmkwGSkp33HBhVpOttdFTS+pSZispgFYI896ChJHXSZs+o6cO9HwBuoCF7Wm+VCjmsbTxAGGj2n3s85OIvNeDsSBRRljZMEn0LefFbXF7QY0Mg8Ux1tTmjPoarVVIeoeqIYV32L3ORSaBg2IuhPoQJXrZDc2MBomtgcWKLjWRl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wy9Ux1/M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wy9Ux1/M"
Received: by smtp.kernel.org (Postfix)
	id BCF5CC2BCB0; Sat, 14 Mar 2026 22:44:44 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C705EC2BC87
	for <tools@kernel.org>; Sat, 14 Mar 2026 22:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C705EC2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-89a6ac6f389so44841376d6.3
        for <tools@kernel.org>; Sat, 14 Mar 2026 15:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773528282; x=1774133082; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuJUhym4M/ZFIJ+HRVLrIiZVMxaVq6Aogwi4UFclA/I=;
        b=Wy9Ux1/MsFNGAx25MCFYZusLse47x+JgQPavDZJj4dKu9jOkghgOQU/mx5FRUjh7v1
         4hOz2JTzjjOvJhItld4hom5MfkGX/VSLdBF9YT/egJVrGvRqAlUGVmJGRv/j3mQnmVCI
         aa2UCxPKBFqKVvheJGdNipks0oJae80hBayGy/rAYph2HqR8y08SAaqBlxVBejXkiUrU
         l+dHJ4oJ0wUd/BSlTy0BpoU+pqpgHdTVqQ8pSgVHbtEOQ/vbwSyVS9fFKrFaTsEMzGZh
         yVVXexmiP+KJt28zKUufbRvpPWOOy3P6SMud9YOpgoIBBwu+tvrMSYwknuFasX3GpBzw
         3z/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773528282; x=1774133082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nuJUhym4M/ZFIJ+HRVLrIiZVMxaVq6Aogwi4UFclA/I=;
        b=c486x9IAp47JbQ5OJMT5t5TBu5pXA8mJY8fC69Dx1hEXNxFc4oaAWGOoTJSTrODzqU
         /J75fK0eW7yraVdhK5Ejz/cj4ukxqV4MZvN5NFppjx73qXd1MYHmJdEihorew6OpkWpg
         u5IQyhzx/GM7IUxmCb3ukMR4y+D2qmvIcFey5gM1ib8SjBOprzo8ZXtVb8ifn7xcNZEU
         cN8P5k1nGcJ8c8OoqsWSqZftkh6qPsMhhtzm++GYiY8Zdfxkjktf51N+XWAIWc5vPJQ4
         +u4qlcYyGXXdkuVlyESgWjViwWatHr9HXPKaJsbJrjJEYiDFVC7+v/nopS8xYDZhRxig
         jUKA==
X-Forwarded-Encrypted: i=1; AJvYcCXSfqpOqyq7dvGov9Lya+3h30ptWG1lROnlavUNHnlo3u5ksQZJ5SHoVotC66+vTSn8NSIq+Q==@kernel.org
X-Gm-Message-State: AOJu0Yw8oiZN2qV7BVJiakO0k6F5MfCsVcB9MfRaP0FO8gntO6N31B4M
	YceBDXyDJrh9QCTMTGcC8OEI4l3MrJt7FJ5ml7VKLvlVS3fuBpqr4q+K
X-Gm-Gg: ATEYQzx/ZFKW9LiJO38O7Ay/sYZ+H5XxNthfQwVBMfrS7ro9vTYJeEvJHN87s5zTuf0
	+w1ONZRaH1oAa6a/Yb/FqKAOZ0uiUvVxT5mHFqtunnDJOAdwOn2EUh5sQ8RyaKsQAL4cpz4Z5TM
	pYw5j703DRwcQGAmHMN1T7wiEvKJ7Vno9aIbjLYRSOMR15XUM8BkIuvh1vY9xXUMNrOFEj1a+g1
	u+QoH8k15HfwT6yY5Wg+PPjDvsdZ/wVZ4f8gAewqaG/uzlnQX0TK1N8PcrwIYkgbX8x+tnXTQGu
	JS7k8NWsXGalYxEQ7XbeGcR0AnOKLH0Nqtt9JuD16bExrWJU4n+ndAU3ZIPMs2miMcgtl9eoCu+
	n/NySzZw3wxKHtlEJE5sSAqTNGXRqiWYgVbao8FDfR4mzY+Q+KOaHSB/7imliIXueFTtI8kAcoN
	p6OINDVD2/bfnR7eckAk6uWEdm9UKbBxe8moCupjwLZjRf2sR1HrvBsSHBsitLNRSF
X-Received: by 2002:a05:6214:529d:b0:89a:173d:9c54 with SMTP id 6a1803df08f44-89a81cb9be9mr117730886d6.8.1773528282565;
        Sat, 14 Mar 2026 15:44:42 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c43bb47c3sm11296526d6.14.2026.03.14.15.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 15:44:41 -0700 (PDT)
Date: Sat, 14 Mar 2026 22:44:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 tools@kernel.org, x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul
 E. McKenney" <paulmck@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Dmitry
 Vyukov <dvyukov@google.com>, Randy Dunlap <rdunlap@infradead.org>, Cyril
 Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, Jake Edge
 <jake@lwn.net>, Askar Safin <safinaskar@zohomail.com>, Gabriele Paoloni
 <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
Message-ID: <20260314224435.35465615@pumpkin>
In-Reply-To: <20260314111822.63a2ba4a@kernel.org>
References: <20260313150928.2637368-1-sashal@kernel.org>
	<20260314111822.63a2ba4a@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Mar 2026 11:18:22 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> > This enables static analysis tools to verify userspace API usage at compile
> > time, test generation based on formal specifications, consistent error handling
> > validation, automated documentation generation, and formal verification of
> > kernel interfaces.  
> 
> Could you give some examples? We have machine readable descriptions for
> Netlink interfaces, we approached syzbot folks and they did not really
> seem to care for those.

The whole thing reminds me of doxygen comment blocks.
They tend to make it hard to read the source files, hard to search
the source files (due to all the extra matches) and are pretty much
always out of date.

The kerndoc comment blocks for trivial helper functions are hard enough
to keep up to date.

The only way even parameter descriptions are going to stay correct is if the
compiler is using the definition and only the comment part is extra.
For error returns you'll need the documentation to be at the return site.

	David
