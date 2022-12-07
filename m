Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62C78BF1
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 19:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eoB3Npf4NJglH4/CfmC2EVDpHkrtcBrDjEBUTa+PeCE=; b=mCh1WpJtMuCBUDOxz59g0vgJc5
	0rDcoyNe1S5wwn+uvJvoaaPk1J6ICM40dajx3ONEGHMg90dWtqRFOXeoEy1CWO6jx7BZ9LbRiShW5
	PFPFs7y1DOIO+qqeDzr4vvR45dlpzGRw3mGF16wOeTWIu5k5aYvZZci293rsiXul2nYy/yMJmxLh7
	kBw+YgXnDKW3A1fJru4Jbj1e9yX03CCOF9QTs6/cfFGSe5r1tq3Ko5R41RNiNatgSAKVAZE3W/9wL
	Ti6PvIa808CbW3EXhPAJaz0hd6SiOvWhV0nWtWZInqJH6XIzyuxHX39JoDd2spaYgYzf7bsfjFqP6
	85Vm010Q==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=59617)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <noralf@tronnes.org>)
	id 1p30Dn-003auO-5M;
	Wed, 07 Dec 2022 20:36:47 +0100
Message-ID: <f0394397-0cd3-72db-36c2-91ba1f98b709@tronnes.org>
Date: Wed, 7 Dec 2022 20:36:44 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: new: b4 send --reflect
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20221206215340.556ov3bdfyf3qvyy@meerkat.local>
 <f8d14fd5-58e0-853d-64e0-72cc60e69629@tronnes.org>
 <20221207182156.zbwmcdckoegef6lf@meerkat.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221207182156.zbwmcdckoegef6lf@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 07.12.2022 19.21, skrev Konstantin Ryabitsev:
> On Wed, Dec 07, 2022 at 05:39:40PM +0100, Noralf Trønnes wrote:
>> Error from endpoint: This service only accepts patches
> 
> Stupidly, I never tested it with a single patch, always with a series.
> Please try again.
> 

Getting closer ;)

$ ~/projects/b4/b4.sh send --hide-cover-to-cc --reflect
Converted the branch to 1 messages
---
To: dri-devel@lists.freedesktop.org
    tzimmermann@suse.de
    kernel test robot <lkp@intel.com>
    Noralf Trønnes <noralf@tronnes.org>
---
  [PATCH] drm/gud: Fix missing include
---
Ready to:
  - send the above messages to just noralf@tronnes.org (REFLECT MODE)
  - via web endpoint: https://lkml.kernel.org/_b4_submit

Press Enter to proceed or Ctrl-C to abort
---
Reflecting via web endpoint https://lkml.kernel.org/_b4_submit
Error from endpoint: Destinations must include a mailing list we recognize.
---
CRITICAL: Was not able to send messages.

I'm getting the same without --reflect

Noralf.
