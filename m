Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EADB17CD3;
	Wed,  9 Nov 2022 14:15:04 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 56DD332009A4;
	Wed,  9 Nov 2022 09:15:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 09 Nov 2022 09:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1668003302; x=
	1668089702; bh=xNx2/6V6yBOcbgjRVPsLADXHWc3a/MAHrWKciAw1SQs=; b=n
	nk+3/WSWXuHJT7PjzyqxSS8LgBB4pjl0PNttHULCu9Sau960LhDlxjAvONKPAHSw
	2V/CeT51jdYmlON3GifRs1QdopsMIIislbkURP8ZIVjCeUoxBUf128wRd1cbrzrO
	l0gsTYB8jG25Rex+T5hXcGlQSvtH6gO04Ih4N1Khjf6zRJC9HW94v8OLa9n0sTTC
	gt0DUctP4FGgU56cB4ZoD4hzQ+vNy7n/kfweKsnKxVALu19RbWBD8N09YQsJe3lY
	aRVe8+gXAE7LeGWydfIqwUi0hNajTNrziZ9hgHio9+lzO+i6i2zAJrhfc8m+BnqG
	3ztS2wqKHqTv5Y3AJ6NDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668003302; x=
	1668089702; bh=xNx2/6V6yBOcbgjRVPsLADXHWc3a/MAHrWKciAw1SQs=; b=E
	/x/AzTc4e4NBiwuow+xNA+IYGQmbByqkBvySXFsDfdVHPVKkEtgTMgYt+AxuT54x
	UDAQ69VSdtEBxVAI5B2jdiY54cWyTOiIAHusM5KJawHlmAvM1jKLr6xi5q1NqrWU
	IJAnMMO20zrdcTxX0uja+8Fli1pYdbnOVhN8eO0+hpJU+HLgSLbfHmSp7hv2NlNB
	1+EzVrvYoFo5Xf7VtYTFgVw5whVC/zYiO1qntHFYcdAnE25eEROiX5G/griCYjrc
	ycjccDz9Jg2RPVWG0h4x0+m3MHtJX4mS7K4qJEYIY4b7kCfN30jLkg7kqBOKCm96
	FYDfaXzXCZTTQHH5eQeHQ==
X-ME-Sender: <xms:5rVrY_PdeHwbAISiqinMfv5ow0C_0UP31_2omKmHTafBBNxLiNRC-Q>
    <xme:5rVrY5_u2DTTx7x42dnULUAzW5ypmY290yhnLooe4uFKik8ivn7AmfTwss510kHP7
    cYppGCIf0_WDdG3Bw4>
X-ME-Received: <xmr:5rVrY-TLtDpDFhVnXkCje6OF2OmjeWecNpsVSm62tKzsViMM4vQkhv3f1yoFuj6I2nAzAOaa21qJgFCHbv_8RdqLPAEnhMxTuXK7oy4mn0oqFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeujefhkeegtefgtdeijeetgeetjeekkedtgfeujeeffedvvdelfeetjeff
    feejleenucffohhmrghinhepuhgsuhhnthhurdgtohhmpdhgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhm
    vgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5rVrYzsUPWFTcH3wTkE_TEW_7MflilOViQtqeZYKIKhWBx7H4yfNgg>
    <xmx:5rVrY3dj1lNdcMK9nBQk8xnm_3egYm5K45YcUQrpeIaN7F9z4kG89g>
    <xmx:5rVrY_3fP7SHa3Mr4EeDXXg-jf36f8kgkUZ4nvUfDNlqdyOmKJ-1bw>
    <xmx:5rVrY-61JnQM14wcOm5cQe_5yr9Si0-xj3rd76NfRUr9sIOqbuj3RQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 09:15:02 -0500 (EST)
Date: Wed, 9 Nov 2022 15:14:59 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <20221109141459.ud2wofasq2jozmks@houat>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
 <20221018201804.na5x7lohm4yszg5h@nitro.local>
 <20221019080140.zc42aqi7gwjpvczs@houat>
 <20221020084930.vpu552rag6gdvmvm@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221020084930.vpu552rag6gdvmvm@houat>

Hi,

On Thu, Oct 20, 2022 at 10:49:30AM +0200, Maxime Ripard wrote:
> On Wed, Oct 19, 2022 at 10:01:40AM +0200, Maxime Ripard wrote:
> > On Tue, Oct 18, 2022 at 04:18:04PM -0400, Konstantin Ryabitsev wrote:
> > > > There's a bunch of things I have noticed in the recent weeks:
> > > >=20
> > > >  - It looks like 87e0e464959c breaks msmtp which doesn't recognize =
the
> > > >    -f option, and will just error out
> > >=20
> > > There's got to be something else going on, since -f is required for s=
endmail
> > > compatibility. The msmtp manpage specifically mentions that is suppor=
ts it:
> > > https://manpages.ubuntu.com/manpages/trusty/man1/msmtp.1.html
> > >=20
> > > (see under "options specific to sendmail mode")
> >=20
> > It might be the auto argument that confuses it then? I'll check.
>=20
> So, here's the behaviour I'm seeing:
>=20
> $ printf "From: <maxime@cerno.tech>\nTo: <maxime@cerno.tech>\nSubject: Te=
st\n\nTest Test." | msmtp -i -f auto maxime@cerno.tech
> msmtp: recipient address maxime@cerno.tech not accepted by the server
> msmtp: server message: 504 5.5.2 <auto>: Sender address rejected: need fu=
lly-qualified address
> msmtp: could not send mail (account default from /home/max/.config/msmtp/=
config)
>=20
> If I drop the -f auto, it works:
>=20
> $ printf "From: <maxime@cerno.tech>\nTo: <maxime@cerno.tech>\nSubject: Te=
st\n\nTest Test." | msmtp -i maxime@cerno.tech
> $ echo $?
> 0
>=20
> It seems to be related to
> https://github.com/marlam/msmtp-mirror/issues/51 except I don't have
> set_from_header in my config. I've tried to use allow_from_override and
> force it to off, and it didn't help.

I just discovered something else.

For various reasons, on one of my series I keep a per-commit changelog,
in the commit log after a ---

This works generally fine, until I run b4 trailers -u which seems to
drop the entire content after --- when adding the tags.

Maxime
