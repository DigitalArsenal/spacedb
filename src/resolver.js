//import pkg from 'json-schema';
//const { JSONSchema4 } = pkg;

export const resolver = (prop, jsonSchema) => {
    if (!prop) return {};
    prop = prop?.items || prop;
    let { $ref, $$ref } = prop;
    if ($ref) {
        let rpath = $ref.split("/").slice(1);
        let fprop = jsonSchema;
        for (let i = 0; i < rpath.length; i++) {
            try {
                fprop = fprop[rpath[i]];
            } catch (e) {
                console.log(fprop);
            }
        }
        fprop.$$ref = $ref || $$ref;
        return resolver(fprop, jsonSchema);
    } else {
        return prop;
    }
};