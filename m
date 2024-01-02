Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B422156F6;
	Tue,  2 Jan 2024 17:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="W6dSfXx9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zrhGUHAE"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.west.internal (Postfix) with ESMTP id 98CAB3200A96;
	Tue,  2 Jan 2024 12:12:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 02 Jan 2024 12:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1704215541; x=1704301941; bh=rFHGbnvHdl
	6eafDT2dFg9tzeoMRhzj6iYhIzUbSot/E=; b=W6dSfXx9MrpU7ETIRip5EDANmB
	SCLkuD1kv87f2d9vJRskAkunHnI4DL1IfJ4aU/AE5e6++c7o+lEpPz3fzz8Sk0ng
	nov652aROX6UEHjUM7mLoE832gc3cljC23sz1x/1HGuLgWGc1L7r1H2+zdq1uaFm
	et0knPXbS0mlWxp/w3cZJX4nfB/dO3zy0PqRMDe9QRhHVxqf9av+7DU5ScZCgcLj
	HVULFCBtXy8Am7dNERKbvH2AhphTpkXgeh0iXq/HTt/jDcHjdm7vmw9D/s9ntfeM
	DTUjr1/reCedzwWMjwi7CUqWZd0gJNjVv6niRMkChEHnbN+JpN/kkJXP3NIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704215541; x=1704301941; bh=rFHGbnvHdl6eafDT2dFg9tzeoMRh
	zj6iYhIzUbSot/E=; b=zrhGUHAEtgUQVWHM8QRRJe7992r4p8tlaVS2GCd84sjf
	NqzxdMkLMBEO0WyRCVS2/a052zLDb2jvzLuwhr3oTUOUnqi8UqW8Pnm8u7aXpzPY
	3sTtarxPCMsYbEwKMPMUsjXbeV6q4qL3p021AjHlNABsk4yMD+YbZONKH04Ssny+
	rp2vknUwIPol++PVj3s6FdzzbSkgWuaFdI7VZp+ZfoLLs27+/ZZla97eo9Hly89Y
	g13GMUoHdsJzeHiNenjdLlRHA9t82cn1iuyK/+QdxWjzy/Tt6IQWq5iSPloBYSou
	Dyk6J4qMRCfX0psT/zcon4D/HKi6aTC2UrvoE24gug==
X-ME-Sender: <xms:9EOUZeHnOz9OTblVkywvrvgCYiCrHUn1bLa8Q6S37wwbS4irsJJEDA>
    <xme:9EOUZfX8N-jDGOxAH1sNSrvGNM5G3cjawFA_w-GUe3UCSuGXprpdrh8eFcb_uVnPI
    cC2WB2UL7l0Wg>
X-ME-Received: <xmr:9EOUZYIqV8xXmC0lG38yP71RrWSR1EV0hn1y9HWAhFTfIIysoyGn2tHfhUqbUPlnOFgULYQdwYVhUkZX-loAoyUeNPiu-kj3OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegfedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepkeeuie
    dugfeuleeitdffkeelleekvdekhfduveffffeuhffhueeikeevheejtefgnecuffhomhgr
    ihhnpehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:9EOUZYFRCYIdiMdADG_mpdh1DSNHsn0rf94gSE89vomozM_EmBYu-A>
    <xmx:9EOUZUVeYfo1E9Gir64AJfdV_xa3S5A-h_LXDAVEND2TsqebCo31-g>
    <xmx:9EOUZbO9qVTVCjsLsGVd2NvyidvSh2HRt3OlPaEcBG5vDfdI4JrEcQ>
    <xmx:9UOUZWIHZ6M8b8xUVWikdkZ5-bQfFAQ_X7wvdF7CEEVWnxbr0sE3PA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jan 2024 12:12:20 -0500 (EST)
Date: Tue, 2 Jan 2024 18:12:18 +0100
From: Greg KH <greg@kroah.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users <users@linux.kernel.org>, tools@linux.kernel.org
Subject: Re: Re: Re: b4 modifying Cc-tags
Message-ID: <2024010227-crusader-bakeshop-2391@gregkh>
References: <CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur>
 <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur>
 <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>

On Tue, Jan 02, 2024 at 06:03:44PM +0100, Geert Uytterhoeven wrote:
> Although the latter may not be strictly required?
> Or are Greg KH and Andrew Morton not using fastmail.com for sending
> email, only for receiving?

I use fastmail for sending stuff from the domain I use fastmail for
(kroah.com), but not for my linuxfoundation.org emails.

thanks,

greg k-h
