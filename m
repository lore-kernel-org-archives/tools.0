Received: from qproxy1-pub.mail.unifiedlayer.com (qproxy1-pub.mail.unifiedlayer.com [173.254.64.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E793BA24
	for <tools@linux.kernel.org>; Mon, 13 Feb 2023 22:20:49 +0000 (UTC)
Received: from gproxy1-pub.mail.unifiedlayer.com (unknown [69.89.25.95])
	by qproxy1.mail.unifiedlayer.com (Postfix) with ESMTP id 9B794803475E
	for <tools@linux.kernel.org>; Mon, 13 Feb 2023 22:20:48 +0000 (UTC)
Received: from cmgw15.mail.unifiedlayer.com (unknown [10.0.90.130])
	by progateway3.mail.pro1.eigbox.com (Postfix) with ESMTP id 9514E1003F4E4
	for <tools@linux.kernel.org>; Mon, 13 Feb 2023 22:20:42 +0000 (UTC)
Received: from box5379.bluehost.com ([162.241.216.53])
	by cmsmtp with ESMTP
	id RhBipxDFdaJXNRhBipDQmu; Mon, 13 Feb 2023 22:20:42 +0000
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.4 cv=ZpQol/3G c=1 sm=1 tr=0 ts=63eab7ba
 a=ApxJNpeYhEAb1aAlGBBbmA==:117 a=ApxJNpeYhEAb1aAlGBBbmA==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=m04uMKEZRckA:10:nop_rcvd_month_year
 a=Qbun_eYptAEA:10:endurance_base64_authed_username_1 a=CCpqsmhAAAAA:8
 a=sg3SanerQoCEkX_6cxUA:9 a=ul9cdbp4aOFLsgKbc677:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tromey.com;
	s=default; h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender
	:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZNB7Xm/cKnWKPaIZ4UgtG8H7mguzjhqyPNLc+nIdiFw=; b=LiRFGnOn60HQjCrj2PxddBcq1N
	vJQ9wa1nvRzphIv1MPglkyEH5G7s8CkkaVj9TxePaHmPXd/3cMsba8ur94zE6BMtvjxQeZg84K7O3
	RRWEAfHEafaIWMRSCU/Bou7BQ;
Received: from 75-166-130-93.hlrn.qwest.net ([75.166.130.93]:38596 helo=prentzel)
	by box5379.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <tom@tromey.com>)
	id 1pRhBi-000sUO-8B;
	Mon, 13 Feb 2023 15:20:42 -0700
From: Tom Tromey <tom@tromey.com>
To: tools@linux.kernel.org
Subject: exception from 'b4 trailers -u'
X-Attribution:  Tom
Date: Mon, 13 Feb 2023 15:20:38 -0700
Message-ID: <87fsb9dx6x.fsf@tromey.com>
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
X-Exim-ID: 1pRhBi-000sUO-8B
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 75-166-130-93.hlrn.qwest.net (prentzel) [75.166.130.93]:38596
X-Source-Auth: tom+tromey.com
X-Email-Count: 1
X-Source-Cap: ZWx5bnJvYmk7ZWx5bnJvYmk7Ym94NTM3OS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes

Today I tried 'b4 trailers -u' and got this:

prentzel. b4 trailers -u
Calculating patch-ids from commits, this may take a moment...
Checking change-id "20230209-submit-value-fixups-2023-3e7d7c6750af"
Grabbing search results from inbox.sourceware.org
Traceback (most recent call last):
  File "/home/tromey/.local/bin/b4", line 8, in <module>
    sys.exit(cmd())
  File "/home/tromey/.local/lib/python3.10/site-packages/b4/command.py", line 360, in cmd
    cmdargs.func(cmdargs)
  File "/home/tromey/.local/lib/python3.10/site-packages/b4/command.py", line 81, in cmd_trailers
    b4.ez.cmd_trailers(cmdargs)
  File "/home/tromey/.local/lib/python3.10/site-packages/b4/ez.py", line 1954, in cmd_trailers
    update_trailers(cmdargs)
  File "/home/tromey/.local/lib/python3.10/site-packages/b4/ez.py", line 862, in update_trailers
    addtrailers = list(lmsg.followup_trailers)
AttributeError: 'NoneType' object has no attribute 'followup_trailers'



I don't know what it means.  I do think there are some trailers to
fetch; this was v3 of a series and I got some email with an approved-by
for a few of the patches in it that weren't approved.

Tom
