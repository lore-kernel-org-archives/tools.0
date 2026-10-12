Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57C03AF646
	for <tools@linux.kernel.org>; Mon, 12 Oct 2026 05:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784727; cv=pass; b=oLXRKmgRKxW91vB5ec+aVFcwH0Jb3vqWMOM6cLV3K0JmZBjqqK2Y9VfFbrNzAUpvwW6+XN+tq8imm528mQhrWCKsz8z8xVMjkokZBqTICVh4MdDFmQO702awyIRnCBm/g3C/YfGaKcu4y6WOMVhoBqw7Sob/W3jkwM0BK6ZeEdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784727; c=relaxed/simple;
	bh=84I8Fs2mDkzRYh3ANSIc9dH7dSslYffVMQ2nK4xkDWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2q/moyBRbHXcw6ct9TCe4+du93a60agckzz30WniNTMzC5Pakkzh+fx+kPQKvy+NZLU1h7IKlfUA85gxpNMOi1GE1+FL/Ij1CxgvHDAsy2kHOfn6tFhyCKa9LDsnYwiiuBVd8725ckd/nGZA0gSzh994MHRShPzOK+ErgWu/Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIBvsgki; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIBvsgki"
Received: by smtp.kernel.org (Postfix)
	id A94FF1F0089D; Mon, 12 Oct 2026 05:58:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791784726;
	b=U+0dnczRZQBrc3tPvdaq71rbICTO2rdTUp+5W7r2y0JxmyG6oX4Kt8ctBwuE1uqwrGYF
	 IRibaSm10EzvNsa87YSFuWy22p0rY0Fsu3AOhrKzTXCV2goMgjHpqc6uwcV3rKQHSfGoG
	 2RbjzF61l1WXOsklt5H2wzZHcrX9poC6P1n6IpaC3ZbX+36zGY4bP/Ebu690v1645kJuZ
	 2rxWls3oD1PUcSvaksxIyIdDrs5gubuUhWrQVoJx6W2p81E4F4QctyTtSn2usF2VF+yEk
	 f1jasvXa6n7TxBRSP7RdJEdoVRq/zyYwEfwF09k9R8MTjhjjEygudkA9ATZyZY8r+Ww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791784726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=2Rn0LF6V1VEl3vFJK0GcgEkTPJM97Pz0TdznwH5J8mQ=;
	b=TYnF9GFV3OMGTfKpijfH54SKlise45BvsN6Kymr8/1wkjUewtU4aPN4a1hWVF5Q9zDot
	 JxhbCbpBq3qTOWUanx4JiVZ/i/zssek6vqX6ghpfdBwZFa3zO7bnBg+oOLBlZlCbpKr+P
	 9MRzWQBQ6WNExyZWbMI4GSZxUExTjaJ7yq0ftUJ6AmCHzni9BvrbEBLeWMFuhQ1K2PgO/
	 g+sTXNfFYWK7n7mhwJkm3/HtEeOXxUNYHu5cIfneK3Q/rY3VQSM7TDmouo3bSOIQ0EB3i
	 rVj3jUdYl3d8V/36ka9PL5QdV1eSONJx7sA525TUiXqS/isHyeEs02F4EA3dpvsmk6g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eIBvsgki;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D5501F0089B
	for <tools@kernel.org>; Mon, 12 Oct 2026 05:58:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eIBvsgki
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2D5501F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33e6279a1d7so2119772eec.1
        for <tools@kernel.org>; Sun, 11 Oct 2026 22:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791784725; x=1792389525; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Rn0LF6V1VEl3vFJK0GcgEkTPJM97Pz0TdznwH5J8mQ=;
        b=eIBvsgkiOCGvj1cL+8nQIL0LDayiiATGHT45sXYTkodisj/MlyjUehp3TpGCJFmSkB
         XJKPsH+81lBLt0e7E+MgVV4epqW2S9kOhgyvDSLiaFwP5W5PAZk70rdAs/5h2ioWhXVB
         OBpSLW2dFTjTDxuFmXbxQXWTylIiBGGVkAyR+x7LEfJbarc52vQZi1RbOF/fIDokraQn
         +vrEQbqDqS1wBMQy6xXbAYbsX6bTo81NkYmPmctfwQm+5HVXvuasNKdAn5TDmORiN4lt
         /waBDAurdMa3cnWmD402KwZvprs4TKkPW92PLVQmUYzn7k0atNv0yw5BZzzUzt6dB6BX
         shDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784725; x=1792389525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Rn0LF6V1VEl3vFJK0GcgEkTPJM97Pz0TdznwH5J8mQ=;
        b=tpMdvOCJP4pQ+u5KSu+gOKIrYSCfUamUOCmDuRSoZwaxwiY0mWsRFteg/NBedLcTD7
         ixwSvYVRqqxwycb9nnKJwJQgjECFtoOSBppHQ3qghrIH7zmkkyHe46k52TYEbLYXk2Xi
         J0XqjNYJBG5a3jvMPHcKxuMjgZ/JRRssMrsr9vaTy5hWMUjJXPtd69z8uXeq33mu6n4q
         +1doqVW7DknvXsrOLKzLUJVjO0KWU9LH0EjzD7xh5SYbiV557wnqB9zqJf5luAeQvcKW
         3gkBhS0i8tSOIZZKuPdsvRdi4KmT5qNnpQYAiLjbAy+Kn2xyo4ESxRAM6TWZFfEbE6GP
         +AMQ==
X-Gm-Message-State: AFq9FYJvbtmsex02q9x89OkKrwYoEo/ccs7jYDvwaq3QHbHGbTN/z0J6
	mvX56DJJrT6PUINbGEaxFuXrnDq9vl6FyoR3XjINLZic+P1K28NgGmj6
X-Gm-Gg: AYBFou0GWeJ9PtGJex1y8dGqyhFX1UkBV81cV+bit+r2e6gsEJy0zsUVNkutcJK+zHL
	1ExyYAeeAQvjxKwV9KNMeKnqysLutbsEeqv4Y0VIq9ZGlbjiw9sO29G6DLDbT1ArRB08+btwjue
	ApEsyuI56jQVarDJDlHHmO/r6fW/BgqhfKReB0u9VZHIk1HoiLkvemi9WG762Ny+jQO/pWDj86B
	XHR0XdsfwOV5ESGFZ4sv2d0uxuF4843yLWk48kAmNlYRckThgQpJX8Uvqgawwmr1hRYmCRSzcUZ
	X+rXdHeRgkPpmSJsDdz/WPuIIGhAaSsw/a6E13QwVF3gFMbDEswP7rQ6+ag6T1l7oZ1ol3xcjeU
	TH5B2htjMYV5WrgJhvogDRSjj/8GWWnD/LHs2qV4S43n0EOexBHzjLgyiJ/a1TOEabCeWL/VBGR
	wlUQoAQX7kzY+VCbSfh+ZVuo5MFo3tVPgJHVBifBd/AZkhNx/EdYdx5emThPNoaCpxJjcLAAy6k
	u7DXbs8g6zNt4Tuibc2rQFfG21S8XAXTJMvTFn423A8JOCDfTBIprvFGu+Nzi1W
X-Received: by 2002:a05:7300:55a5:b0:35a:29b6:b466 with SMTP id 5a478bee46e88-35a29b6c486mr3229528eec.30.1791784725163;
        Sun, 11 Oct 2026 22:58:45 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8999:e631:ed58:366a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b19c6c7b4sm3101612eec.24.2026.10.11.22.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:58:44 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 11 Oct 2026 22:58:30 -0700
Subject: [PATCH b4 v2 5/5] misc/send-receive: require messages payload to
 be a list
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-send-series-bcc-v2-5-cd17584c40fb@gmail.com>
References: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
In-Reply-To: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-36fec

In Python, str is a subclass of collections.abc.Sequence, so checking
isinstance(umsgs, Sequence) accepts a bare string value for "messages"
and iterates over individual characters during validation.

Check isinstance(umsgs, list) directly so non-array JSON values for
"messages" immediately fail with "Invalid messages array".

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 misc/send-receive.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/misc/send-receive.py b/misc/send-receive.py
index 22e049b..96eb3fb 100644
--- a/misc/send-receive.py
+++ b/misc/send-receive.py
@@ -514,7 +514,7 @@ class SendReceiveListener(object):
         if not umsgs:
             self.send_error(resp, message='Missing the messages array')
             return
-        if not isinstance(umsgs, Sequence):
+        if not isinstance(umsgs, list):
             self.send_error(resp, message='Invalid messages array')
             return
         logger.debug('Received a request for %s messages', len(umsgs))

-- 
2.56.0.385.gd3acb90ef8-goog

