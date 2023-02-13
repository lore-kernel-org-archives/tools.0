Received: from qproxy6-pub.mail.unifiedlayer.com (qproxy6-pub.mail.unifiedlayer.com [69.89.23.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB64185A
	for <tools@linux.kernel.org>; Mon, 13 Feb 2023 03:48:53 +0000 (UTC)
Received: from progateway7-pub.mail.pro1.eigbox.com (unknown [67.222.38.55])
	by qproxy6.mail.unifiedlayer.com (Postfix) with ESMTP id 66669802D3DD
	for <tools@linux.kernel.org>; Mon, 13 Feb 2023 03:27:08 +0000 (UTC)
Received: from cmgw15.mail.unifiedlayer.com (unknown [10.0.90.130])
	by progateway7.mail.pro1.eigbox.com (Postfix) with ESMTP id 3193910047418
	for <tools@linux.kernel.org>; Mon, 13 Feb 2023 03:27:01 +0000 (UTC)
Received: from box5379.bluehost.com ([162.241.216.53])
	by cmsmtp with ESMTP
	id RPUbpcdbaVjI3RPUbpkePV; Mon, 13 Feb 2023 03:27:01 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=AZZ0o1bG c=1 sm=1 tr=0 ts=63e9ae05
 a=ApxJNpeYhEAb1aAlGBBbmA==:117 a=ApxJNpeYhEAb1aAlGBBbmA==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=m04uMKEZRckA:10:nop_rcvd_month_year
 a=Qbun_eYptAEA:10:endurance_base64_authed_username_1 a=nH0rgXNm0EhMwGWHg0YA:9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tromey.com;
	s=default; h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender
	:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pvU2tZ0QYB95JVHi2RHHaVELx/rEdxN2RpwOSwLIle4=; b=wzK9bfqeJ7EmkqR/5yuKmKu3EV
	wmQKoTJwUBnuPoggBMnPXUpFbTwGHckjHD3YFp3MoHs8xU8TJVkbX+DKerlyrpZgZ/jPenCD+l1qO
	iHqMd+JqUKDS2jwlxdWY09aD1;
Received: from 75-166-130-93.hlrn.qwest.net ([75.166.130.93]:33042 helo=prentzel)
	by box5379.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <tom@tromey.com>)
	id 1pRPUa-001LfJ-V9;
	Sun, 12 Feb 2023 20:27:01 -0700
From: Tom Tromey <tom@tromey.com>
To: tools@linux.kernel.org
Subject: b4 doesn't allow remote tracking branches
X-Attribution:  Tom
Date: Sun, 12 Feb 2023 20:26:57 -0700
Message-ID: <87k00mdz3y.fsf@tromey.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5379.bluehost.com
X-AntiAbuse: Original Domain - linux.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tromey.com
X-BWhitelist: no
X-Source-IP: 75.166.130.93
X-Source-L: No
X-Exim-ID: 1pRPUa-001LfJ-V9
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 75-166-130-93.hlrn.qwest.net (prentzel) [75.166.130.93]:33042
X-Source-Auth: tom+tromey.com
X-Email-Count: 63
X-Source-Cap: ZWx5bnJvYmk7ZWx5bnJvYmk7Ym94NTM3OS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes

I tried to do:

    b4 prep -e origin/master

... but it gave me some error.
Instead I had to do 'b4 prep -e master'.

Then, today, I forgot to checkout master + rebase before doing a 'b4
send', so it sent some random patches from origin/master as part of my
series.

I think it would be nice if b4 let me use a remote branch as the base
for my branch.  'git rebase' has no issue with this.

thanks,
Tom
