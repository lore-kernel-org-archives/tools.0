Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C380D516
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 17:38:55 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso10628994pjb.2
        for <tools@linux.kernel.org>; Fri, 10 Mar 2023 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678469935;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :subject:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fdta9cykP5iiHW+gPuMCjeJUUYeZ0mYGW0yQ6rTcpHo=;
        b=b4cxufGvIG+FmGwKEf6ybIvBYxiHtki/CzjX/Ais76y2zyibZCH01wAlBJ64Qmj70a
         7+Ljz/a8ozdM6TLpiatgz3aTan9O9JOYLwjCLy+kFouUFf0vEd50dpk7EWYpd/Icel5+
         NqnmIzo32CDAi8z2WoqaMm606/2fePemg3AK/9HuW2g2WjqjbyDa2IYPuPP03XwCr+Yy
         WB5g7idSkHNVB5udt2iTgbywXX+ndlhMWpWB7CFql05Me+HoGMOeKsdCZ9G4U1ezWcRH
         R407wFJsCRaeBxxWDRDvwMlz0M/zpBa6R5vKn3MkOPRD295zGY6NSIoY4rB9AXSDXMB5
         pv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678469935;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :subject:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fdta9cykP5iiHW+gPuMCjeJUUYeZ0mYGW0yQ6rTcpHo=;
        b=K1IRR2jDsUaM3BfkLDDmSbnEaYyiXTDP9oY+SwJdY1bOHI9V1OSkSEospHeNnmnVqF
         n7r7a5Jyc5H49kTpkZH1SAkUO+gqJBMWc2bUzp3r71Z6FgyLyRfEFCN1JamUWpG0cRwa
         nMiLYuwIrTaW2gqb73wdRaFt/bXHQzMUKO7YmQHaPVgn9/ZWVg9i6G8+2ZmQ1dkhZiTd
         LkYmKRv4Z/tZatgt59OL1si4PxjjI7DYrakd2adpk43ghmSdB89nIkpZKlivyZOfJns6
         lohlIDzx9Li++ZNjVD8QjEHmVuzldI7lf/nCQ5pqT/t/TlMSH7LQrWh0BqxRuVKn/zhz
         fbHg==
X-Gm-Message-State: AO0yUKU3h7e8Bcwikx400CNxJGOqygYo/QBsFcFtbomfWR8ccQ+DlgVa
	S5nrtLXTJJYPIwINxAHpLDY00Q==
X-Google-Smtp-Source: AK7set/MxiWn8NaBSmt4ID0pnhpnf8hlU3Hs9Efd2CXlgAYfe2IFGzIoPIiHfSgNmgpyxyPaidHY4A==
X-Received: by 2002:a17:903:2282:b0:19a:a9d8:e47f with SMTP id b2-20020a170903228200b0019aa9d8e47fmr32780979plh.36.1678469934603;
        Fri, 10 Mar 2023 09:38:54 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id lf6-20020a170902fb4600b0018963b8e131sm237687plb.290.2023.03.10.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 09:38:54 -0800 (PST)
Date: Fri, 10 Mar 2023 09:38:54 -0800 (PST)
X-Google-Original-Date: Fri, 10 Mar 2023 09:38:03 PST (-0800)
Subject: b4 shazam picking up the wrong author from patchwork/lore
CC: Conor Dooley <conor@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tools@linux.kernel.org
Message-ID: <mhng-2765f5e1-e3d9-4f36-82e2-1212e13b0cdd@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Conor just pointed out that 2a8db5ec4a28 ("RISC-V: Don't check 
text_mutex during stop_machine") was listed as authored by him, despite 
having a From in the message body.  That usually works fine so I'm not sure
what happened here -- no big deal because neither of us really care about the
authorship on this one (and the SOBs are fine), but figured it'd be best to say
something in case it bites someone else.

I merged the patch with

    b4 shazam -lts https://patchwork.kernel.org/project/linux-riscv/patch/20230303143754.4005217-1-conor.dooley@microchip.com/

which is the way I usually do things.  This is the first time I've noticed any
sort of issue like this.

Just to make some headaches: I've got some out-of-tree patches for b4 still.
It reproduced locally for Conor, who I'm assuming has a cleaner tree, but just
for full disclosure here's what I'm running:

* 901c5b9 - (HEAD -> palmer, palmer/palmer) shazam: Add the --add-message-id argument (3 weeks ago) <Palmer Dabbelt>
* ca426a4 - mbox: Add the --pipe-each-message argument (4 weeks ago) <Palmer Dabbelt>
* f54fa86 - pr: Provide more information on PR fetch failures (4 weeks ago) <Palmer Dabbelt>
* ada3021 - (b4/master) PEP inspection cleanups (5 weeks ago) <Konstantin Ryabitsev>
* a328183 - ez: modify --show-info to allow getting single value (5 weeks ago) <Konstantin Ryabitsev>
* 9e0bcc5 - Up version to 0.13-dev (5 weeks ago) <Konstantin Ryabitsev>
* 7e797fe - shazam: Add the --merge-base argument (5 weeks ago) <Palmer Dabbelt>
* 173e358 - Use typing compatible with python 3.8 (6 weeks ago) <Konstantin Ryabitsev>
* 63004e9 - Update patatt to 0.6.3 (6 weeks ago) <Konstantin Ryabitsev>
* 1f7f126 - (tag: v0.12.0) Up version to 0.12.0 (7 weeks ago) <Konstantin Ryabitsev>

That's all in git.kernel.org/palmer/b4 (still meaning to get around to testing
your better version of the Message-ID bits, sorry it's just been crazy here for
a bit).
