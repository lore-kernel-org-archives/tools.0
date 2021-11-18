Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C4A2C85
	for <tools@linux.kernel.org>; Thu, 18 Nov 2021 12:15:04 +0000 (UTC)
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 18 Nov 2021 13:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1637237119; bh=kx4HYoTDi5qju9XQjdwr0hOzM+3dqSVDtMNS/pJeCqk=;
	h=From:To:Cc:Subject:Date:From;
	b=Wh8n0+8ixkjkcRNHPLeiQ68iMXo1s0hw/BDDFF1QDkKV71LvXetnIAgqYysX2rdkg
	 xUVpM1+HLKCbDQmJkNnH9gNUt7sR2G+hFBMCqYMINztAFkKGGnm6Kc05Uc/pAHx5D9
	 3sAhc4H6Ln8v2F/Yg6l9IQ/FWb2oK2x0VzxMxCg8=
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 5D53B8048C;
	Thu, 18 Nov 2021 13:05:19 +0100 (CET)
Received: from nsc-arm64.ads.avm.de (unknown [172.27.14.4])
	by buildd.core.avm.de (Postfix) with ESMTP id 5322C180EC7;
	Thu, 18 Nov 2021 13:05:19 +0100 (CET)
Received: by nsc-arm64.ads.avm.de (Postfix, from userid 1000)
	id 319C77402D9; Thu, 18 Nov 2021 13:05:19 +0100 (CET)
From: Nicolas Schier <n.schier@avm.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org,
	Nicolas Schier <n.schier@avm.de>
Subject: [PATCH 0/1] mbox: Exit with error code if no messages were found
Date: Thu, 18 Nov 2021 13:05:13 +0100
Message-Id: <20211118120514.277328-1-n.schier@avm.de>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: 149429::1637237119-0000060F-C9794C3D/0/0
X-purgate-type: clean
X-purgate-size: 767
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

Hi,

working with b4 on a local public-inbox installation, I stumbled across
the behaviour of 'b4 am'.  I knew a correct Message-Id and wanted to
fetch the whole patch set as soon as it reaches the public-inbox
instance.  Thus I did a stupid

  while ! b4 am MSGID; do sleep 10; done

'b4 am MSGID' showed 'That message-id is not known.' and exited with
return code 0.  As this seemed strange to me I added a 'sys.exit(0)' to
fix my use case; but this patch feels too simple to be good.

Can someone point me to some point(s) I am currently too blind to see?

Kind regards,
Nicolas


Nicolas Schier (1):
  mbox: Exit with error code if no messages were found

 b4/mbox.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.30.2

