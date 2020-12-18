Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by mx.groups.io with SMTP id smtpd.web10.321.1608327135542685849
 for <tools@linux.kernel.org>;
 Fri, 18 Dec 2020 13:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toke.dk header.s=20161023 header.b=N28xsGP7;
 spf=pass (domain: toke.dk, ip: 45.145.95.4, mailfrom: toke@toke.dk)
From: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
	t=1608327131; bh=aWqHBvy3+cqUx3rFKlcwz+HQe2k5zXP/xkUYrDIad48=;
	h=From:To:Cc:Subject:Date:From;
	b=N28xsGP7XPCUlvSbsEoSVPm7VPd+RpoDTptb8mGbVwFxRj1uSOtvt2KPt7GgU+3if
	 fW5f6xqFx6ieCawgv8mI+1mdDs0gvWF2eL5uOamOjNosKIJTn7B6z3mCrcGbMHH8N/
	 FKOezSpcFbCtam5jkjM0qBuVHqNMdZ78mJIXlOjjhWGjU6fMRUycBHfFMXsAfo2b6x
	 KPZ3dwhrrGBbp1qWkpYC5FdG15EH/aEcDKVyDjrzgcqUZLAjKYaJzu1zpCK3+6vPeQ
	 USEmAKhM2qBBQZZ3MNvsh2n5E/+0s66plAjtskehmp6I0woxR9RFVpIS8mQ6f4C13V
	 kU2WW1bTShoTg==
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org, Jens Axboe
 <axboe@kernel.dk>, Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: b4: encouraging using the cover letter in merge commits?
Date: Fri, 18 Dec 2020 22:32:11 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <877dpeol5w.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain

Hi Konstantin

Jens, Arnaldo and I just had a twitter conversation[0] about cover
letters and merge commits. Do you think it would be possible to support
the 'include the cover letter text in the merge commit message' work
flow in b4, maybe even encourage it?

I notice b4 will already save the cover letter along with the patch mbox
file, but maybe it would be possible to automate the workflow some more?
A 'b4 merge' command that wraps 'git merge' and pre-populates the commit
message with the text from the cover letter? Or some other trick? WDYT?

-Toke

[0] https://twitter.com/toke_dk/status/1340002668346040321
