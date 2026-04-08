Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731023C063A
	for <tools@linux.kernel.org>; Wed,  8 Apr 2026 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775650456; cv=none; b=CAlMi8rTtgGlNs9FJDQN09sO6j6e56MJiC2Aje9TQMd8HEn02xvt/aUlE6W3cXI01GTv/dUd873lz8d6K6GqrBF9Pj94TZwFQya33vI+a5xFPmFUDNbqi/LfORjlxRg9HP1lzgib8oqp0PTdLxMCcxKYa8drhCo3PGYw6o81GV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775650456; c=relaxed/simple;
	bh=8scfsOfxjJCA7PsheVSzcMVVAN4HZJ5wygd7fo905BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXPvo4MRNgwj0MMp1CzBUiqgo9x+liXKSVRKnLpKstHRTP+DRBfS9UUfcX1p462UVHzWRnVk+eEyKKpPQxN/YtvYf0kfAlK23To6kK+di4o2RHfPmqsZGCOCHIZ1g2X/i9Eh7fsA2cUV/aePn3k1rxXuD5d27B+NGZbD0/n0MRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 244A0C19424; Wed,  8 Apr 2026 12:14:16 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5702DC19421
	for <tools@kernel.org>; Wed,  8 Apr 2026 12:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5702DC19421
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cb3bae8d3eso576268885a.1
        for <tools@kernel.org>; Wed, 08 Apr 2026 05:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775650454; x=1776255254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGRbYznGbDw7bAVfW0akDmACi6u2DoC61pG2AP+p98k=;
        b=L0oBk8IRVgvE+kzVrtoARtTzCsIMOLIaz/Os36SS8fqxzQOqboLXluRCRemYXaRRyO
         VxPW9CPu8/VHC2KsO/AgJzR57y+wf/7Ydhybd8afWcT9XpvLMA5iLDsz74Fd0Lr/5Trj
         hlpSeqLxTf6ZH73hsXbnFusa0BsBFtlbY3NIqjqTDSqwBE1kPTc4elaNJCvnoOSUWWkt
         AFYWdzoCiNzGfgOE0kLr23Fqt4+bLj7o1wAPeJFl1JkmL3l4q4DkIZwp0oxEAqWaX4pj
         N3lCrC44he5y2XdKVFUpmhuYZ81G79ruYdI9BKhwRnlzsLw4hx6dL34zIlTw5USz2tBo
         4Iow==
X-Forwarded-Encrypted: i=1; AJvYcCWLWlorotlV/vXm5LVgW1ucVUeW/Bx9mMyADmO9+WXQco2Jn3SIzyFjhb5wjW/uGY8k4RJ+mg==@kernel.org
X-Gm-Message-State: AOJu0YxT7U0SqAFChxK/YF5IPCB2l3gm2HucCF41IhxFl5k2mt1MVrN5
	++wYw8Q2/bTGKXv9gY3u0O0hTqLWGfO1H7ODvsjcQxru9WKVZ8lrqSp2srkCpA==
X-Gm-Gg: AeBDieuQdm61WoT1eZGtiRMFzNTGcTPNBqLHJzohwLD20okoR+f/QsWKB6m8BbEArwb
	2+QRUmme0ZjyVvVQHYFJVUeruj0T1/I5Z2yHoDnM3FwYCIGaQr882NRqi0L98+4ZF6IOrFoh2Uk
	FQpKLx4WvQhl9uIXGNnWuP7xL+GZjtxw8Zu+CXOzr9dPBlDjZoU7Jd7tFM+X6eY4CVRyeqncUXx
	p1LEA3YPynUNpxUkZDd/HPQOLtSja/O8/2moGa+PapZEMfBGUW9Qb/7m2SILutiv20MKjWwHHAG
	Mm9Ob9thoj1bERI3YQSFhuUlVfEJJj6k8j40IpS2/t1kkOECgVmgef8OZ2XzEMNPQxLB61Wz9jp
	fjtIOaMZ0MfgbRQX7I6kE4EBfQNQK2mQccM0ig6afHqqy7uDSJHmi8uiliSi2mUq8INhCmBkLyV
	GuFdY7RjKXAIiXK7F+6RHZ1kqDTvrPPULqwbWkJZKnfoEHdZMPdmpwBaAZU8eINRjDl9UgGW4=
X-Received: by 2002:a05:620a:2946:b0:8cf:e933:d069 with SMTP id af79cd13be357-8d41e248d43mr2887338085a.49.1775650454071;
        Wed, 08 Apr 2026 05:14:14 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a1307586sm1507212485a.0.2026.04.08.05.14.13
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 05:14:13 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89cc797547fso72094356d6.2
        for <tools@kernel.org>; Wed, 08 Apr 2026 05:14:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/aEXgcoxBl0/9z04qyqbumeCHNR/QKS2lzbU2WDAouBqWH21oDLnqwi5jzSSYH6Y4YvmZiQ==@kernel.org
X-Received: by 2002:a05:6122:3784:b0:56d:92dd:a0ad with SMTP id
 71dfb90a1353d-56daba970e8mr8020585e0c.15.1775649953503; Wed, 08 Apr 2026
 05:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20260313150928.2637368-1-sashal@kernel.org> <20260314111822.63a2ba4a@kernel.org>
 <abZTg9ZwnE5J4qXa@laps>
In-Reply-To: <abZTg9ZwnE5J4qXa@laps>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 14:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5Ga9WCzD8ji8kgOMmosS+uzf_8mp_OkhFdcAg2=3KAg@mail.gmail.com>
X-Gm-Features: AQROBzA3VNDAkN7JQ2RBFKXcNeNTnnQqU_cNeGRDhYiY7nC0FR4lVKTSqS90qsM
Message-ID: <CAMuHMdU5Ga9WCzD8ji8kgOMmosS+uzf_8mp_OkhFdcAg2=3KAg@mail.gmail.com>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, tools@kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Dmitry Vyukov <dvyukov@google.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, Jake Edge <jake@lwn.net>, 
	David Laight <david.laight.linux@gmail.com>, Askar Safin <safinaskar@zohomail.com>, 
	Gabriele Paoloni <gpaoloni@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Sun, 15 Mar 2026 at 07:36, Sasha Levin <sashal@kernel.org> wrote:
> On Sat, Mar 14, 2026 at 11:18:22AM -0700, Jakub Kicinski wrote:
> >On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> >> This enables static analysis tools to verify userspace API usage at compile
> >> time, test generation based on formal specifications, consistent error handling
> >> validation, automated documentation generation, and formal verification of
> >> kernel interfaces.
> >
> >Could you give some examples? We have machine readable descriptions for
> >Netlink interfaces, we approached syzbot folks and they did not really
> >seem to care for those.
>
> Once the API is in a machine-readable format, we can write formatters to
> output whatever downstream tools need. The kapi tool in the series
> already ships with plain text, JSON, and RST formatters, and adding new
> output formats is straightforward. We don't need to convince the
> syzkaller folks to consume our specs, we can just output them in a
> format that syzkaller already understands.
>
> For example, I have a syzlang formatter that produces the following
> from the sys_read spec in this series:
>
>    # --- read ---
>    # Read data from a file descriptor
>    #
>    # @context process, sleepable
>    #
>    # @capability CAP_DAC_OVERRIDE: Bypass discretionary access control on read permission
>    # @capability CAP_DAC_READ_SEARCH: Bypass read permission checks on regular files
>    #
>    # @error EPERM (-1): Returned by fanotify permission events...
>    # @error EINTR (-4): The call was interrupted by a signal before any data was read.
>    # @error EIO (-5): A low-level I/O error occurred.
>    # @error EBADF (-9): fd is not a valid file descriptor, or fd was not opened for reading.
>    # @error EAGAIN (-11): O_NONBLOCK set and read would block.
>    # @error EACCES (-13): LSM denied the read operation via security_file_permission().
>    # @error EFAULT (-14): buf points outside the accessible address space.
>    # @error EISDIR (-21): fd refers to a directory.
>    # @error EINVAL (-22): fd not suitable for reading, O_DIRECT misaligned, count negative...
>    # @error ENODATA (-61): Data not available in cache...
>    # @error EOVERFLOW (-75): File position plus count would exceed LLONG_MAX.
>    # @error EOPNOTSUPP (-95): Read not supported for this file type...
>    # @error ENOBUFS (-105): Buffer too small for complete notification...

The actual E-values are positive, so I guess you want e.g. -EPERM?

Note that the actual errno values are architecture-specific.
E.g. EOPNOTSUPP can be 45, 95, 122, or 223.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
