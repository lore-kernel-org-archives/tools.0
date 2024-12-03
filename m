Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916C91F4731
	for <tools@linux.kernel.org>; Tue,  3 Dec 2024 17:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733245490; cv=none; b=H5N1CMJaSQxexhUdrX8yfzfGfWgilJ1v3lt5So4GdUxQY//lDUDbe/zSgCTA6vCNwcH8tGes28jxHXBWV9XkS3GCG6vKSmK24+rIU+kTdmZ2tYFe1y5S0mHc6IKH5/PKJ24fi/7T1mmsJXEw/JWm5jwdaCa14tnmtbHEDlb+r9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733245490; c=relaxed/simple;
	bh=t3Fm4MHTpa/yvv4OBOsQ4gvwsOCSCyolXFFN3Q8SWoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXmxbqlea4eySHbsoUprS+FoCKTOPSzpWXJ75T8Zv5Jouwg3/sgwTw2n7Tg1NgDRqUql1MybbjACGl2TILPNRUhq9uFRVwvv2y8ES7dF985ygdwvActVSW3HoLfpHkOPhosCjwF2BI+hUiB9veo13QSRpgGQHinf7+fXjNY6gxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+4qAIxt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+4qAIxt"
Received: by smtp.kernel.org (Postfix)
	id 285C6C4CED9; Tue,  3 Dec 2024 17:04:50 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55D1EC4CED8
	for <tools@kernel.org>; Tue,  3 Dec 2024 17:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55D1EC4CED8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffd711274dso4521fa.0
        for <tools@kernel.org>; Tue, 03 Dec 2024 09:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733245486; x=1733850286; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t3Fm4MHTpa/yvv4OBOsQ4gvwsOCSCyolXFFN3Q8SWoY=;
        b=d+4qAIxtU6qcumcIIZ/HlCXET4gOa7HSWPBmy4KvmOfocMiayJk/26HOUw19gpvMXv
         dS7MOAUbeaiBtUonZrYCzlqQA2SSDnKjvixNvaeJwIDBplU/WvuZUcM3ww5qL94RUbC7
         5FIaZuznbkFr5JPhENqyCRmEAoUfOwkDg0lYonuaXC82NuXycDG/VXIt2TlsB7X4DFtc
         8yoZyDPQEDp0qLT9bWaEn7cCXGDuap5UZR25Vd/o72sBSfGa05ZfaZ7j6MfYhG5Yr3r7
         0QH/bAAKNnFfj/RU8Xiaw6zjs0DuP7hhRzMhkRIOKLGBUSVETVjO9HFvIUkOM2JCaZG4
         WfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733245486; x=1733850286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3Fm4MHTpa/yvv4OBOsQ4gvwsOCSCyolXFFN3Q8SWoY=;
        b=SXM4Zqu79XjL6XebCQjnchXWG4YdR7ZYNrMFlQNEtWLNPiMpd25A+TEVsUXSIeUml7
         Xx41Fa6/Hb/snwRVcGp1GFn3t7BmYAXCVDy/KGGsG1Ef9hsbyQbA5IC0rvT/h/Z3OB8i
         1pIE5LETc4AN0RxDkNZVKZ7eM3eKGx4MUan4B6kAcYspJj82ftZ3ohITriCG+sp8+au8
         Vjkr4+WgOtAUFYJVttX2yE1PzjG+CSSvYDmNZK6LNbLcM8gfcch5h386hbcksCMFRYf0
         0vY5ONQuH/8CE5VSaOIWFF8JmSblMl8DN1Lw7gW4AY2dq/UCivykFEPXj0Ponpnaedxg
         LEvA==
X-Gm-Message-State: AOJu0YxOXllh38CeOnYBtvsRGOuUYnF+hdP1VZnjQryyM86wQjrMBvYZ
	MQwvGPJZIosVBW/hJFtsLAWRFSSTH3dzGJFrFX5LoEnRVnnhojFubLHL680Gs3yJirdSQ9pYP+R
	aftKp75RK2nGn974uvvSK1HD7sWvz/gNH
X-Gm-Gg: ASbGncvhDZLhn5xBVVsceuOsqy8CFbMG8Sx+fQjzOnm0mrdi1+huhTyHIdyLAOxWLUj
	7QKP5El+G3KiSsX02Q/AXF30tOKyuQAHKa7ZOcefqRdoAwmk=
X-Google-Smtp-Source: AGHT+IHBEpLi4JNDlYItYdp/fZd0PHL501sbIt2u4Vef3E+Cc5w5m+TawsUx6bLu3AmLB0GxOsvlKEsUi6/XIpf+020=
X-Received: by 2002:a05:651c:2117:b0:2ff:e54a:cd08 with SMTP id
 38308e7fff4ca-3000a2450c7mr10544441fa.3.1733245486212; Tue, 03 Dec 2024
 09:04:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
In-Reply-To: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 3 Dec 2024 12:04:10 -0500
Message-ID: <CAJ-ks9=jGp8d4q0wqRqZ8Lut3o-QypwR8EP3bfBmXXTNjQVvaA@mail.gmail.com>
Subject: Re: [b4 PATCH RESEND 0/5] Resolve some static typing errors
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Gentle ping. Kostantin, how can I help move this forward?
