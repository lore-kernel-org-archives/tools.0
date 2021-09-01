Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B39A3FC1
	for <tools@linux.kernel.org>; Wed,  1 Sep 2021 14:48:13 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1C4731FF0A;
	Wed,  1 Sep 2021 14:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1630507686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DW1RaEEKs69muaPX+UAvS2YJE4nDAsjqH5kxNwjeld0=;
	b=CpuMTGIBDMyS+OICbuWBzHn5Faf/8c1la/LPGh0GjDf2y5RXv80PVtoXP28nNlaemBC1Dr
	8OpVj63zqnHLsSrTcTKqXSUdRDwLiT9X4NqrQnnWiBCVmpkCWXC3LiA5PWScfCoPGc56qI
	NxhjxBVv1/gZ3omA9pbba0hkDqZVaRw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1630507686;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DW1RaEEKs69muaPX+UAvS2YJE4nDAsjqH5kxNwjeld0=;
	b=ZsVZlqjhNcH+YyY4FSpYzgm2ExThtJ4qzNbD0yAh921gBXqBpbfxLa9e7BYADgbqhf+WYe
	zgcmCTQwZl8+DGBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0291413ADA;
	Wed,  1 Sep 2021 14:48:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA
	id p5xlO6WSL2GucgAAGKfGzw
	(envelope-from <vbabka@suse.cz>); Wed, 01 Sep 2021 14:48:05 +0000
Message-ID: <582896df-8791-43f5-1422-db00e92b8291@suse.cz>
Date: Wed, 1 Sep 2021 16:48:05 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org
References: <20210901141637.fmvgs4hnk6m4ym7x@meerkat.local>
From: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: b4 v0.8.0 is available
In-Reply-To: <20210901141637.fmvgs4hnk6m4ym7x@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/21 16:16, Konstantin Ryabitsev wrote:
> Other than lore.kernel.org compatibility changes, the only significant
> difference with version 0.7.3 is the --guess-base code, which should be a lot
> more useful with this release. E.g. this message back from June is
> successfully resolved to match the commit without any conflicts (gc485f7e98):
> 
> https://lore.kernel.org/lkml/20210617101910.13228-1-song.bao.hua@hisilicon.com/T/#t
> 
> 	Link: https://lore.kernel.org/r/20210617101910.13228-1-song.bao.hua@hisilicon.com
> 		   attempting to guess base-commit...
> 	 Base: tags/v5.13-rc1-284-gc485f7e9863c (exact match)

I don't know how exactly it works, but looks like it could
still try a bit harder?

b4 am --guess-base 20210819195533.211756-1-hannes@cmpxchg.org

...

Link: https://lore.kernel.org/r/20210819195533.211756-1-hannes@cmpxchg.org
       attempting to guess base-commit...
 Base: tags/v5.14-rc1-55-g00c85b6576d3 (best guess, 3/8 blobs matched)
       git checkout -b 20210819_hannes_cmpxchg_org tags/v5.14-rc1-55-g00c85b6576d3
       git am ./20210819_hannes_mm_kconfig_move_swap_and_slab_config_options_to_the_mm_section.mbx

3/8 blobs matched means "git am" fails

The earliest commit where it succeeds isn't that far away, actually:
git describe 2a03085ce887^
v5.13-257-gf356aeacf7bb

Thanks,
Vlastimil
