Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794535262;
	b=RvCmaAKwFvifX6eiaZylntKhAZa2GnwhSCAcrp1ItnDU+qj6ZhG5Zf3j3eEYwGv5UK7z
	 OaUn2tvxTnywXPtkxURMgnLWnWkoFZdBsxJfZDZn5dEt21AAbwGiZpnZYSA3lLPjX5FpV
	 2tRGi/v5TE3MBEBG62ZVmPvoEW0NSg9MDKYDba0kRB6bjliIjsldSonCHVksR8YdsQ9fs
	 SlMUm7E9nXM+c+aXxM0i47VB3pk3llhidkQAkhG3t0IXdrntWgYL0+5pAyXMywkWHOlMA
	 iIxjTyj1Ba+Ox2VmrSFKTnqOjy+HBgur32RtyysT+dasFmqpeaycT/huDnrVUREeozQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794535262;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=gs0Hp5pRXiGWUmsnbgtjqMIBpCsRGLEZW3So2SiCoCQ=;
	b=Cm4MJ8IziKdKL2H+TPFzFQwkhQ0hEsqueRvCb3L5KNBYOkN/z8+NmrRLs+hEwAy0iejM
	 KNfk9U9Anv5i30IkbRjzvwr7qfpRMC7cPws11+y5T54DOL9xiEdXIH+rPLjailNPf0Ut+
	 /Zs8fdiwIBR1AoZsp0lGtie6/HJhjzLy+ZqOT8axLxZXJMl8yjDZ71lV5aQwqc/aGzWDr
	 SmSwlKmSUlR3D0ow0wY/TfgGOcdMM730FlowLX/YKrpWoiJbnlFOdrv0zl9cxYr3sJBXD
	 gQBwklIzb/11k11lrBdkoUgRJ7t/YWRGDZlxR7SEsmfhPxqfkvIBJaeINKW/FchN02A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Sn3ct/bb";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2614606A31C
	for <tools@linux.kernel.org>; Fri, 13 Nov 2026 02:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sn3ct/bb
Received: by smtp.kernel.org (Postfix)
	id 5DAF31F000C5; Fri, 13 Nov 2026 02:01:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794535262;
	b=sb6oseJDl61tLhSwi647KKoObtSk8zhIyNA1yISrvAqvLn3TuyVKCUQieVzAK4zskwCs
	 l+dvsddaBezRCh07qVb/uAeRB3P3HR+64VUbj8KM69rnU1KsePZCNw6ZYIvz3TIUHpMRY
	 5EkiavdKIaLIFVLNAqXi+5Bp0XQUmCUz71sVR8Xc//hyTWeJs7a5/ptSpJucRiNCHZJBa
	 77WC+Rvkx+jV7RLGVsttuvxTT0DNFQbGjVGC+EWVyzeZTDi1UePChOSJfTKwt2ctJ3IZO
	 QODJ2ICOF+S+km0urakv/28WmP10XIx+q1jhDMiLVVW6RLs/l1Pa6P0sWj/LEGqSKGg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794535262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Content-Disposition;
	bh=gs0Hp5pRXiGWUmsnbgtjqMIBpCsRGLEZW3So2SiCoCQ=;
	b=C/AnpTmbJ9XG38H2zG0OemFLMj0pCkuGLfWOj9dSVr1FUkPoFlz1/Y5sBC5adiUzy8tH
	 3Z1VOJsoaMHpZmPo1V0FMx57jEfvvb6OUXgZCog4gUzmg2gafE942PZzUPVZhvKUsDHOT
	 OtcBK8LMOO3iViegdTXIYFO301SyVbjxuUbgctj6BAl6r6k5MbLjcjf+EIZd/duoEdjJK
	 e6LEFE+2n4LkExpJVDdHcQYKAavft56A+91PREEcytNPLGIhu9t6GxA42lenqAV7XDAHB
	 GRZthiwWFdbnG8evKTNwhjMjc2zYOMXh5crfpw2XDf5P13+AliiFQcznjAbi08E+MOw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Sn3ct/bb";
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C03171F000C4
	for <tools@kernel.org>; Fri, 13 Nov 2026 02:01:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sn3ct/bb
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C03171F000C4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1073685eec.0
        for <tools@kernel.org>; Thu, 12 Nov 2026 18:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794535261; x=1795140061; darn=kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gs0Hp5pRXiGWUmsnbgtjqMIBpCsRGLEZW3So2SiCoCQ=;
        b=Sn3ct/bb7AKwhtVPAecy3cFwWUNgga14ZYlkwuWRRkl2DcqwH8VX9jomNSLhQ5jKct
         0tFL/P04oC6BAAgOFxge+q2Cm0rqGDiGaYiis/nxpQrcN48W0vw8qWT/c/r/aDzupy6r
         iHHrlBQA98kyeU/XG3DEcioPvqm7zg5ReHZIVK8j0qEzAe0QzMoUUkVErwDkt4LZAgI1
         WOzNWytgT84pnWuia2waLqpvIEFcHSvY2xDgFfIVKrOHLW3KiLov1fg3r1z+PeC/LzQh
         m8bjC6GlULhEM6wGARWb5j9sHtogJF/jr30h4QnRwlW16SM1ExSWdk41/O8hRFzjklDq
         dZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794535261; x=1795140061;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gs0Hp5pRXiGWUmsnbgtjqMIBpCsRGLEZW3So2SiCoCQ=;
        b=w4Lpp4y1ZhY4IwWGdcStysBXh/A8Scw0zGNKPAI3FniX26+WCR5ycei1z3+UvCrm4a
         7XoqCK3miUlJxfTf2sqpj9zaG0jIaPdrse+Jgvi3yEnZakXle9FsNIxOb4sKnxrpdIRT
         h/5u7smAqEofiKAD+zbEAoifo4l7BU0MFo8LO0QUMGK8YUG9iIIASm6ynLAKULvaHhtj
         awIam9JunA7pyqETjSZdYE8f334GflKe/kiJcKmUv978ibj1Fg341h5s8piHs0Hc6+0M
         lniYDc1drzzYgiK7IKL2SRh9tyfoYqqc0tx8ldpM9FQ/QHP2xXMkc5V2hJObikCWTSYF
         +EJw==
X-Gm-Message-State: APuU4Z9jg3sYrggyOzm6tcihM+bQuTiGaPM5Mge2eKx/4x1O9u8d80Iq
	IaLa4bcRI7oKljTTgYP5RT0DekXSglISFktC+GGNUqd+qf3wXcEyuJsb
X-Gm-Gg: AYBFou3PcpELqC+0OKavFkRgzTpg0Zx3BU3YULspv9ETRmxBWHeinKWLVc92v/M9FHQ
	Hb4BCsxuTWOZTI+Cwrf3p9MUKg5zPTRW+U2WSvZ+cPbREToCOXSIERc/4WHxSi0Y4j+tS1WtOm3
	UowOL/IBYtoyu0n/pdR7sOI/X1v64s35GAY5B6hL95diZ5vm/ZzeLBcvjIUl0wIFAlu+xPAG8Jk
	shNDXf6/7BJN2GYoBci3u74j9ixMyY83eEf2gndMC2zJfMF/1HJDIpyMJERJ2ett0uNUs2Wo1hX
	2Uz94htSD15m2ZdOVpKS5EvbbBEMfA6zc3ArRGNmz+V4e/ZS2OMgECzyq0Dvo72eNocoOuRJsbL
	aYaL+T7OVsphawkqEMGVA6bxgdQ8N/lSod9bvIKChADOaL2iY1y88bqFR0PDKZ0oJ/2Jxf5n8E3
	J5YKnA8Y7fTECD7HuTwpGJKGZg86vnVoGCpQU0AihRLqRobD28wWQzAQ+Hpc0yusajL6At+H1pd
	VDnr+ujH2uo6LHVc5PD7fBhdfbSYbAgl2jHel7kt3HbxHnc5eAEPc8Ve0wvli3AVJDoKhx9pIu6
	K5r05YG6Yz5zmzXm4bIvURmavLuzcGTjCZbl4khhO90RUpAw6JxYFGcyPZfeS9dLcH0Ul8E=
X-Received: by 2002:a05:7300:d18b:b0:36d:37c4:3759 with SMTP id 5a478bee46e88-37965f9d24cmr963828eec.18.1794535260505;
        Thu, 12 Nov 2026 18:01:00 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm4698187eec.21.2026.11.12.18.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:00:59 -0800 (PST)
Date: Thu, 12 Nov 2026 18:00:58 -0800
Message-ID: <be4f7254e8873986fbd9dbf58f47de78@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2 0/5] b4: Implement BCC support for patch submissions and review
In-Reply-To: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
References: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Konstantin,

On Sun, Oct 11, 2026 at 10:58:25PM -0700, Dmitry Torokhov wrote:
> This series implements support for sending patch series and review
> replies to blind carbon copy (BCC) recipients.
>
> The work is split into four parts:
> 1. Server-side support in misc/send-receive.py to receive optional BCC
>    envelope destinations via the JSON submission payload and deliver
>    them over SMTP while enforcing anti-abuse limits (max-client-bcc)
>    and public mailing list destination checks (mustdest).
> 2. Client-side support in b4 to inject series-wide BCC addresses
>    directly into envelope recipients (destaddrs) in send_mail() without
>    adding or stripping temporary Bcc: headers. This extends BCC
>    capability across sending tools (b4 send, b4 review, b4 ty) and
>    supports web endpoint submission.
> 3. Per-message Bcc: header handling in send_mail() and the review/bugs
>    TUIs, extracting Bcc: headers into envelope recipients and stripping
>    them before signing and sending while rejecting them on the web
>    endpoint.
> 4. Safety guardrails in ez.py to reject Bcc: trailers in patches and
>    cover letters so they are never treated as person trailers and
>    leaked into public Cc: headers.

Gentle ping on this series. Have you had a chance to take a look or do
you have any thoughts on this approach? Give a holler if you would like
me to send a v3 rebased onto current master (no functional changes, just
minor conflict resolutions in send-receive.py and ez.py).

Thanks.

-- 
Dmitry
